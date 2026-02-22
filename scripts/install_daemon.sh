#!/bin/bash
#
# Install Geometry OS Directive Daemon as a systemd user service
#
# Usage:
#   ./install_daemon.sh           # Install and start
#   ./install_daemon.sh --uninstall  # Remove service
#   ./install_daemon.sh --status     # Check status
#

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"
SERVICE_NAME="geometryos-directive-daemon"
SERVICE_FILE="$PROJECT_ROOT/systemd/${SERVICE_NAME}.service"
INSTALL_DIR="$HOME/.config/systemd/user"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

log_info() { echo -e "${GREEN}[INFO]${NC} $1"; }
log_warn() { echo -e "${YELLOW}[WARN]${NC} $1"; }
log_error() { echo -e "${RED}[ERROR]${NC} $1"; }

get_python_path() {
    # Prefer virtualenv python, fallback to system python3
    if [ -f "$PROJECT_ROOT/.venv/bin/python3" ]; then
        echo "$PROJECT_ROOT/.venv/bin/python3"
    else
        which python3
    fi
}

install_service() {
    log_info "Installing $SERVICE_NAME..."

    # Check dependencies
    if ! command -v xdotool &> /dev/null; then
        log_error "xdotool not found. Install with: sudo apt install xdotool"
        exit 1
    fi

    if ! command -v convert &> /dev/null; then
        log_error "ImageMagick not found. Install with: sudo apt install imagemagick"
        exit 1
    fi

    # Create user systemd directory
    mkdir -p "$INSTALL_DIR"

    # Get Python path
    PYTHON_PATH=$(get_python_path)
    log_info "Using Python: $PYTHON_PATH"

    # Generate service file with substitutions
    sed -e "s|%USER%|$USER|g" \
        -e "s|%WORKDIR%|$PROJECT_ROOT|g" \
        -e "s|%PYTHON%|$PYTHON_PATH|g" \
        "$SERVICE_FILE" > "$INSTALL_DIR/${SERVICE_NAME}.service"

    # Reload systemd
    systemctl --user daemon-reload

    # Enable and start
    systemctl --user enable "$SERVICE_NAME"
    systemctl --user start "$SERVICE_NAME"

    log_info "Service installed and started!"
    log_info "Check logs: journalctl --user -u $SERVICE_NAME -f"
}

uninstall_service() {
    log_info "Uninstalling $SERVICE_NAME..."

    systemctl --user stop "$SERVICE_NAME" 2>/dev/null || true
    systemctl --user disable "$SERVICE_NAME" 2>/dev/null || true
    rm -f "$INSTALL_DIR/${SERVICE_NAME}.service"
    systemctl --user daemon-reload

    log_info "Service uninstalled."
}

check_status() {
    if [ -f "$INSTALL_DIR/${SERVICE_NAME}.service" ]; then
        log_info "Service is installed"
        systemctl --user status "$SERVICE_NAME" --no-pager || true
    else
        log_warn "Service is not installed"
    fi
}

show_usage() {
    cat << EOF
Usage: $(basename "$0") [COMMAND]

Commands:
  (none)       Install and start the daemon (default)
  --uninstall  Stop and remove the service
  --status     Check service status
  --help       Show this help message

Environment Variables (can be set in ~/.config/environment.d/):
  WP_URL         WordPress endpoint (default: http://localhost:8080/ai-publisher.php)
  POLL_INTERVAL  Polling interval in seconds (default: 5)
  USE_LLM        Enable LLM-powered execution (default: false)
  LLM_ENDPOINT   LLM API endpoint (default: http://localhost:11434/api/generate)
  LLM_MODEL      LLM model name (default: llama3.2:latest)

Examples:
  # Basic installation
  ./install_daemon.sh

  # Check if running
  ./install_daemon.sh --status

  # View logs
  journalctl --user -u geometryos-directive-daemon -f

  # With LLM enabled
  mkdir -p ~/.config/environment.d
  echo "USE_LLM=true" > ~/.config/environment.d/geometryos.conf
  ./install_daemon.sh
EOF
}

# Main
case "${1:-}" in
    --uninstall)
        uninstall_service
        ;;
    --status)
        check_status
        ;;
    --help|-h)
        show_usage
        ;;
    *)
        install_service
        ;;
esac
