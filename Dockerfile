FROM php:7.4-fpm-alpine

WORKDIR /var/www/app

RUN apk update && apk add \
                coreutils \
                freetype-dev \
                libjpeg-turbo-dev \
                libjpeg-turbo \
                libpng-dev \
                libzip-dev \
                jpeg-dev \
                libxml2-dev \
                icu-dev \
                zlib-dev \
                curl-dev \
                imap-dev \
                libxslt-dev libxml2-dev \
                postgresql-dev \
                libgcrypt-dev \
                oniguruma-dev

#RUN docker-php-ext-configure gd --with-freetype --with-jpeg &&  \

RUN docker-php-ext-configure gd --with-freetype --with-jpeg && \
    docker-php-ext-install gd && apk --no-cache add nodejs npm

#RUN set -e; docker-php-ext-install -j "$(nproc)" gd


COPY --from=composer:latest /usr/bin/composer /usr/local/bin/composer

USER root

RUN chmod 777 -R /var/www/app
