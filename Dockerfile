FROM ruby:2.7.6

WORKDIR /app

# Update rubygems and install specific bundler version
RUN gem update --system 3.3.22 && \
    gem install bundler:2.3.26

# Install Jekyll dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    nodejs

# Install gems
COPY Gemfile* ./
RUN bundle install

# Copy the rest of your Jekyll site
COPY . .

# Jekyll default port
# Updated to match ASTRO one! for convenience
EXPOSE 4321

# Start Jekyll server
CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0", "--port", "4321"]