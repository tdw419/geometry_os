# Hybrid LLM Proxy

A Python proxy server that intelligently routes LLM requests between Claude API and local LM Studio based on task type and availability.

## Features

1. **Dual Protocol Support**: Accepts Anthropic-format requests, translates to OpenAI format for LM Studio
2. **Smart Routing**:
   - Background tasks (file reads, glob, search) -> Local LM Studio
   - Default tasks -> Claude API
   - Think tasks (analysis, design) -> Claude API
3. **Auto Fallback**: Detects 429 rate limit errors and automatically falls back to LM Studio
4. **CTRM Integration**: Logs routing decisions to CTRM database for analysis
5. **Health Checks**: `/health` endpoint shows availability of both backends

## Installation

```bash
# Install dependencies
pip install -r requirements-hybrid-proxy.txt

# Or manually
pip install fastapi uvicorn aiohttp pydantic
```

## Configuration

Configure via environment variables:

| Variable | Default | Description |
|----------|---------|-------------|
| `HYBRID_PROXY_HOST` | `0.0.0.0` | Server host |
| `HYBRID_PROXY_PORT` | `4000` | Server port |
| `ANTHROPIC_API_KEY` | - | Claude API key |
| `LM_STUDIO_BASE_URL` | `http://localhost:1234` | LM Studio URL |
| `HYBRID_PROXY_ENABLE_FALLBACK` | `true` | Enable 429 fallback |
| `HYBRID_PROXY_LOG_ROUTING` | `true` | Log routing decisions |

## Usage

### Start the server

```bash
# Using the startup script
./scripts/start_hybrid_proxy.sh

# Or directly with Python
cd src
python3 -m hybrid_proxy.server
```

### Make requests

The proxy accepts Anthropic-format requests at `/v1/messages`:

```bash
curl -X POST http://localhost:4000/v1/messages \
  -H "Content-Type: application/json" \
  -H "x-api-key: your-key" \
  -d '{
    "model": "claude-3-5-sonnet-20241022",
    "max_tokens": 1024,
    "messages": [{"role": "user", "content": "Hello!"}]
  }'
```

### Health check

```bash
curl http://localhost:4000/health
```

## Task Classification

The proxy classifies requests based on message content:

- **Background**: Keywords like "file read", "glob", "search" -> LM Studio
- **Think**: Keywords like "analyze", "design", "architect" -> Claude
- **Default**: Everything else -> Claude

## Architecture

```
Client Request (Anthropic format)
         |
         v
+------------------+
|  FastAPI Server  |
|   Port 4000      |
+------------------+
         |
         v
+------------------+
|  RequestRouter   |
|  - TaskClassifier|
|  - FallbackHandler|
+------------------+
         |
    +----+----+
    |         |
    v         v
Claude API   LM Studio
(429 -> fallback)
```

## Files

- `config.py` - Configuration from environment variables
- `translator.py` - Anthropic <-> OpenAI protocol translation
- `router.py` - Task classification and routing logic
- `fallback.py` - 429 detection and fallback handling
- `server.py` - FastAPI server implementation
