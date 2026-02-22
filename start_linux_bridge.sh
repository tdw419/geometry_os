#!/bin/bash
# Start the Linux Bridge WebSocket server

cd "$(dirname "$0")"

echo "🐧 Starting Linux Bridge..."
echo "   WebSocket: ws://localhost:8767"
echo "   QEMU: Alpine Linux"
echo ""

# Check for websockets library
python3 -c "import websockets" 2>/dev/null || {
    echo "Installing websockets..."
    pip3 install websockets
}

# Start the bridge
exec python3 systems/pixel_compiler/webmcp_linux_bridge.py
