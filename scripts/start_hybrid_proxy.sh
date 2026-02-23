#!/bin/bash
# Hybrid LLM Proxy Startup Script
# Routes requests between Claude API and LM Studio

set -e

# Configuration
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"
SRC_DIR="$PROJECT_ROOT/src"
HOST="${HYBRID_PROXY_HOST:-0.0.0.0}"
PORT="${HYBRID_PROXY_PORT:-4000}"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo "======================================"
echo "  Hybrid LLM Proxy"
echo "======================================"
echo ""

# Check Python
if ! command -v python3 &> /dev/null; then
    echo -e "${RED}Error: python3 not found${NC}"
    exit 1
fi

# Check dependencies
echo -e "${YELLOW}Checking dependencies...${NC}"

# Check for FastAPI
if ! python3 -c "import fastapi" 2>/dev/null; then
    echo -e "${RED}Error: fastapi not installed${NC}"
    echo "Install with: pip install fastapi uvicorn aiohttp"
    exit 1
fi

# Check for uvicorn
if ! python3 -c "import uvicorn" 2>/dev/null; then
    echo -e "${RED}Error: uvicorn not installed${NC}"
    echo "Install with: pip install uvicorn"
    exit 1
fi

# Check for aiohttp
if ! python3 -c "import aiohttp" 2>/dev/null; then
    echo -e "${RED}Error: aiohttp not installed${NC}"
    echo "Install with: pip install aiohttp"
    exit 1
fi

echo -e "${GREEN}Dependencies OK${NC}"

# Show configuration
echo ""
echo "Configuration:"
echo "  Host: $HOST"
echo "  Port: $PORT"
echo "  LM Studio URL: ${LM_STUDIO_BASE_URL:-http://localhost:1234}"
echo "  Claude API: ${ANTHROPIC_API_KEY:+configured (hidden)}"
echo "  Fallback enabled: ${HYBRID_PROXY_ENABLE_FALLBACK:-true}"
echo ""

# Check if LM Studio is available
echo -e "${YELLOW}Checking LM Studio availability...${NC}"
if curl -s "${LM_STUDIO_BASE_URL:-http://localhost:1234}/v1/models" > /dev/null 2>&1; then
    echo -e "${GREEN}LM Studio is available${NC}"
else
    echo -e "${YELLOW}Warning: LM Studio may not be running at ${LM_STUDIO_BASE_URL:-http://localhost:1234}${NC}"
fi
echo ""

# Start the server
echo -e "${GREEN}Starting Hybrid LLM Proxy...${NC}"
echo ""

cd "$SRC_DIR"

# Set PYTHONPATH to include src directory
export PYTHONPATH="$SRC_DIR:$PYTHONPATH"

# Run with uvicorn
exec python3 -m uvicorn hybrid_proxy.server:app \
    --host "$HOST" \
    --port "$PORT" \
    --log-level info \
    --no-access-log
