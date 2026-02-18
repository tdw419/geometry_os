#!/bin/bash
# Parallel Swarm Demo Launcher
# Starts all infrastructure for the multi-agent visual demo

set -e

echo "=========================================="
echo "  Geometry OS - Parallel Swarm Demo"
echo "=========================================="
echo ""

# Colors
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

# Ports
A2A_PORT=8766
VM1_PORT=8765
VM2_PORT=8768
VNC1="127.0.0.1:0"
VNC2="127.0.0.1:1"

check_port() {
    ss -tulpn 2>/dev/null | grep -q ":$1 " && return 0 || return 1
}

wait_for_port() {
    local port=$1
    local max_wait=30
    local count=0
    while ! check_port $port && [ $count -lt $max_wait ]; do
        sleep 1
        ((count++))
    done
    [ $count -lt $max_wait ]
}

# 1. Check QEMU VMs
echo -e "${YELLOW}[1/5] Checking QEMU VMs...${NC}"
VM_COUNT=$(pgrep -c qemu-system-x86 2>/dev/null || echo "0")
if [ "$VM_COUNT" -lt 2 ]; then
    echo -e "${RED}ERROR: Need 2 QEMU VMs running. Found: $VM_COUNT${NC}"
    echo "Start VMs with:"
    echo "  qemu-system-x86_64 -enable-kvm -drive file=./apps/linux/ubuntu-24.04-desktop.qcow2,format=qcow2 -m 4096 -vnc :0 -monitor telnet:127.0.0.1:4444,server,nowait &"
    echo "  qemu-system-x86_64 -enable-kvm -drive file=./apps/linux/ubuntu-24.04-desktop.qcow2,format=qcow2 -m 4096 -vnc :1 -monitor telnet:127.0.0.1:4445,server,nowait &"
    exit 1
fi
echo -e "${GREEN}OK: $VM_COUNT VMs running${NC}"

# 2. Check VNC ports
echo -e "${YELLOW}[2/5] Checking VNC ports...${NC}"
if check_port 5900 && check_port 5901; then
    echo -e "${GREEN}OK: VNC ports 5900 and 5901 are listening${NC}"
else
    echo -e "${RED}ERROR: VNC ports not available${NC}"
    exit 1
fi

# 3. Start A2A Router
echo -e "${YELLOW}[3/5] Starting A2A Router on port $A2A_PORT...${NC}"
if check_port $A2A_PORT; then
    echo -e "${GREEN}OK: A2A Router already running${NC}"
else
    python3 systems/pixel_compiler/a2a_router.py --port $A2A_PORT &
    sleep 2
    if wait_for_port $A2A_PORT; then
        echo -e "${GREEN}OK: A2A Router started${NC}"
    else
        echo -e "${RED}ERROR: Failed to start A2A Router${NC}"
        exit 1
    fi
fi

# 4. Start Vision Bridge 1
echo -e "${YELLOW}[4/5] Starting Vision Bridges...${NC}"
mkdir -p /tmp/vision_bridge_1 /tmp/vision_bridge_2

if ! pgrep -f "vision_bridge.*8765" > /dev/null; then
    python3 vision_bridge.py start --port $VM1_PORT --vnc $VNC1 --monitor 4444 --work-dir /tmp/vision_bridge_1 &
    sleep 3
fi

if ! pgrep -f "vision_bridge.*8768" > /dev/null; then
    python3 vision_bridge.py start --port $VM2_PORT --vnc $VNC2 --monitor 4445 --work-dir /tmp/vision_bridge_2 &
    sleep 3
fi

if pgrep -f "vision_bridge.*8765" > /dev/null && pgrep -f "vision_bridge.*8768" > /dev/null; then
    echo -e "${GREEN}OK: Both Vision Bridges running${NC}"
else
    echo -e "${RED}ERROR: Vision Bridges not started${NC}"
    exit 1
fi

# 5. Summary
echo ""
echo -e "${GREEN}=========================================="
echo "  Swarm Infrastructure READY"
echo "==========================================${NC}"
echo ""
echo "Services:"
echo "  - A2A Router:     ws://localhost:$A2A_PORT"
echo "  - Vision Bridge 1: ws://localhost:$VM1_PORT (VM1 - Researcher)"
echo "  - Vision Bridge 2: ws://localhost:$VM2_PORT (VM2 - Producer)"
echo ""
echo "Visual Demo:"
echo "  Open: systems/visual_shell/web/test_swarm_demo.html"
echo ""
echo "Run CLI Demo:"
echo "  python3 systems/visual_shell/swarm_demo.py"
echo ""
