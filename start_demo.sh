#!/bin/bash
# Geometry OS - Visual Shell Demo Launcher
# Starts all required backend services for the E2E demo

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
LOG_DIR="$SCRIPT_DIR/.geometry/logs"
PID_DIR="$SCRIPT_DIR/.geometry/pids"

# Create directories
mkdir -p "$LOG_DIR" "$PID_DIR"

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
NC='\033[0m'

echo -e "${CYAN}"
echo "╔══════════════════════════════════════════════════════════════╗"
echo "║          GEOMETRY OS - Visual Shell Demo Launcher            ║"
echo "╠══════════════════════════════════════════════════════════════╣"
echo "║  Starting all backend services for E2E demo...               ║"
echo "╚══════════════════════════════════════════════════════════════╝"
echo -e "${NC}"

# Function to start a service
start_service() {
    local name=$1
    local port=$2
    local script=$3
    local pid_file="$PID_DIR/${name}.pid"
    local log_file="$LOG_DIR/${name}.log"

    # Check if already running
    if [ -f "$pid_file" ]; then
        local pid=$(cat "$pid_file")
        if ps -p $pid > /dev/null 2>&1; then
            echo -e "${YELLOW}[SKIP]${NC} $name already running on port $port (PID: $pid)"
            return
        fi
    fi

    echo -e "${GREEN}[START]${NC} $name on port $port..."
    python3 "$script" > "$log_file" 2>&1 &
    echo $! > "$pid_file"
    sleep 0.5

    # Verify it started
    if ps -p $(cat "$pid_file") > /dev/null 2>&1; then
        echo -e "       ${GREEN}✓${NC} PID: $(cat $pid_file)"
    else
        echo -e "       ${RED}✗ Failed to start${NC}"
        cat "$log_file" | tail -5
    fi
}

# Function to stop all services
stop_all() {
    echo -e "${YELLOW}Stopping all services...${NC}"
    for pid_file in "$PID_DIR"/*.pid; do
        if [ -f "$pid_file" ]; then
            local pid=$(cat "$pid_file")
            local name=$(basename "$pid_file" .pid)
            if ps -p $pid > /dev/null 2>&1; then
                kill $pid 2>/dev/null || true
                echo -e "  ${GREEN}✓${NC} Stopped $name (PID: $pid)"
            fi
            rm -f "$pid_file"
        fi
    done
}

# Function to show status
show_status() {
    echo -e "\n${CYAN}Service Status:${NC}"
    echo "─────────────────────────────────────────────────"

    local all_running=true

    for pid_file in "$PID_DIR"/*.pid; do
        if [ -f "$pid_file" ]; then
            local pid=$(cat "$pid_file")
            local name=$(basename "$pid_file" .pid)
            if ps -p $pid > /dev/null 2>&1; then
                echo -e "  ${GREEN}●${NC} $name (PID: $pid)"
            else
                echo -e "  ${RED}○${NC} $name (stopped)"
                all_running=false
            fi
        fi
    done

    if [ "$all_running" = true ]; then
        echo -e "\n${GREEN}All services running!${NC}"
    fi
}

# Handle arguments
case "${1:-start}" in
    start)
        # Start services
        start_service "terminal_positions" 8765 "$SCRIPT_DIR/systems/visual_shell/server/terminal_positions.py"
        start_service "git_diff" 8766 "$SCRIPT_DIR/systems/visual_shell/server/git_diff.py"
        start_service "shell_bridge" 8767 "$SCRIPT_DIR/systems/visual_shell/server/shell_bridge.py"
        start_service "file_api" 8768 "$SCRIPT_DIR/systems/visual_shell/server/file_api.py"

        echo ""
        echo -e "${CYAN}══════════════════════════════════════════════════════════════${NC}"
        echo -e "${GREEN}Demo Ready!${NC}"
        echo ""
        echo "Services:"
        echo "  • Terminal Positions:  http://localhost:8765"
        echo "  • Git Diff API:        http://localhost:8766"
        echo "  • Shell Bridge:        ws://localhost:8767"
        echo "  • File API:            http://localhost:8768"
        echo ""
        echo "To view demo:"
        echo -e "  ${CYAN}cd systems/visual_shell/web && python3 -m http.server 8080${NC}"
        echo -e "  Open: ${CYAN}http://localhost:8080/demo.html${NC}"
        echo ""
        echo "Commands:"
        echo "  $0 status   - Show service status"
        echo "  $0 stop     - Stop all services"
        echo "  $0 restart  - Restart all services"
        echo -e "${CYAN}══════════════════════════════════════════════════════════════${NC}"
        ;;

    stop)
        stop_all
        ;;

    restart)
        stop_all
        sleep 1
        $0 start
        ;;

    status)
        show_status
        ;;

    logs)
        local name=${2:-""}
        if [ -n "$name" ] && [ -f "$LOG_DIR/${name}.log" ]; then
            tail -f "$LOG_DIR/${name}.log"
        else
            echo "Available logs:"
            ls -la "$LOG_DIR"/*.log 2>/dev/null || echo "  No logs found"
            echo ""
            echo "Usage: $0 logs <service_name>"
        fi
        ;;

    *)
        echo "Usage: $0 {start|stop|restart|status|logs [service]}"
        echo ""
        echo "Commands:"
        echo "  start    - Start all backend services"
        echo "  stop     - Stop all backend services"
        echo "  restart  - Restart all backend services"
        echo "  status   - Show status of all services"
        echo "  logs     - View logs (optionally for specific service)"
        exit 1
        ;;
esac
