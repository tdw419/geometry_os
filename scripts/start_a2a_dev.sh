#!/usr/bin/env bash
#
# A2A Coordination Development Server Launcher
# ===========================================
#
# Starts both the A2A Router backend and the Web server for testing
# coordination primitives (locks, barriers) and A2A messaging.
#
# Usage:
#   ./scripts/start_a2a_dev.sh
#
# Then open: http://localhost:8000/test_a2a_tools.html
#
# Ports:
#   8000 - Web server (test page)
#   8766 - A2A WebSocket router
#
# Press Ctrl+C to stop both servers
#

set -e

# Project root directory
PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$PROJECT_ROOT"

echo "================================"
echo "A2A Dev Server Launcher"
echo "================================"
echo "Project: $PROJECT_ROOT"
echo ""

# Color codes for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Cleanup function
cleanup() {
    echo ""
    echo -e "${YELLOW}Shutting down servers...${NC}"

    if [[ -n "$A2A_PID" ]]; then
        echo "Stopping A2A Router (PID: $A2A_PID)"
        kill "$A2A_PID" 2>/dev/null || true
    fi

    if [[ -n "$WEB_PID" ]]; then
        echo "Stopping Web Server (PID: $WEB_PID)"
        kill "$WEB_PID" 2>/dev/null || true
    fi

    # Wait for processes to terminate
    wait "$A2A_PID" 2>/dev/null || true
    wait "$WEB_PID" 2>/dev/null || true

    echo -e "${GREEN}All servers stopped.${NC}"
}

# Register cleanup on exit
trap cleanup EXIT INT TERM

# Check if ports are available
check_port() {
    local port=$1
    local name=$2

    if lsof -i ":$port" -sTCP:LISTEN -t >/dev/null 2>&1; then
        echo -e "${RED}Error: Port $port is already in use${NC}"
        echo "Please stop the process using port $port ($name) and try again."
        exit 1
    fi
}

check_port 8766 "A2A Router"
check_port 8000 "Web Server"

# Start A2A Router
echo -e "${GREEN}Starting A2A Router on port 8766...${NC}"
python3 -m systems.pixel_compiler.a2a_router \
    --host localhost \
    --port 8766 \
    --log-level INFO &
A2A_PID=$!

# Give A2A router time to start
sleep 1

# Check if A2A router started successfully
if ! kill -0 "$A2A_PID" 2>/dev/null; then
    echo -e "${RED}Error: A2A Router failed to start${NC}"
    echo "Check the logs above for errors."
    exit 1
fi

echo -e "${GREEN}A2A Router running (PID: $A2A_PID)${NC}"

# Start Web Server
echo -e "${GREEN}Starting Web Server on port 8000...${NC}"
python3 -m systems.pixel_compiler.web_server &
WEB_PID=$!

# Give web server time to start
sleep 1

# Check if web server started successfully
if ! kill -0 "$WEB_PID" 2>/dev/null; then
    echo -e "${RED}Error: Web Server failed to start${NC}"
    echo "Check the logs above for errors."
    exit 1
fi

echo -e "${GREEN}Web Server running (PID: $WEB_PID)${NC}"

echo ""
echo "================================"
echo -e "${GREEN}All servers started successfully!${NC}"
echo "================================"
echo ""
echo "A2A WebSocket: ws://localhost:8766/a2a"
echo "Test Page:     http://localhost:8000/test_a2a_tools.html"
echo ""
echo "Available Coordination Tools:"
echo "  - a2a_acquire_lock:  Acquire distributed locks"
echo "  - a2a_release_lock:  Release held locks"
echo "  - a2a_barrier_enter: Synchronize at barriers"
echo "  - a2a_send_message:  Direct agent messaging"
echo "  - a2a_broadcast:       Broadcast to agent types"
echo "  - a2a_subscribe:       Event subscriptions"
echo ""
echo "Press Ctrl+C to stop all servers."
echo ""

# Wait for any process to exit
wait -n
