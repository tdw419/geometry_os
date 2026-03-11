#!/bin/bash
# Install Geometry OS Directive Daemon as systemd service

set -e

WORKDIR="$(cd "$(dirname "$0")/.." && pwd)"
USER=$(whoami)
SERVICE_DIR="$HOME/.config/systemd/user"
SERVICE_FILE="$SERVICE_DIR/geometryos-directive-daemon.service"

echo "=== Installing Directive Daemon ==="
echo "Working directory: $WORKDIR"
echo "User: $USER"

# Create service directory
mkdir -p "$SERVICE_DIR"

# Generate service file with substitutions
sed -e "s|%USER%|$USER|g" \
    -e "s|%WORKDIR%|$WORKDIR|g" \
    "$WORKDIR/systemd/geometryos-directive-daemon.service" > "$SERVICE_FILE"

echo "Service file: $SERVICE_FILE"

# Reload systemd
systemctl --user daemon-reload

echo ""
echo "=== Installation Complete ==="
echo ""
echo "Commands:"
echo "  Enable:  systemctl --user enable geometryos-directive-daemon"
echo "  Start:   systemctl --user start geometryos-directive-daemon"
echo "  Status:  systemctl --user status geometryos-directive-daemon"
echo "  Logs:    journalctl --user -u geometryos-directive-daemon -f"
echo "  Stop:    systemctl --user stop geometryos-directive-daemon"
echo ""
echo "To enable LLM mode, edit $SERVICE_FILE and set USE_LLM=true"
