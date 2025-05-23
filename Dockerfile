FROM python:3.11-slim

ENV PYTHONUNBUFFERED True

ENV APP_HOME /app

ENV PORT 10000

WORKDIR $APP_HOME

COPY . ./

RUN pip install --no-cache-dir -r requirements.txt

CMD exec gunicorn --bind :$PORT --workers 1 --threads 8 --timeout 0 main:app