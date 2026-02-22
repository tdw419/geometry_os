#!/bin/bash
# Stage 2: Install GUI and Shotcut on Alpine
# Run via SSH

set -e

echo "=== Installing GUI and Shotcut ==="

# Update system
apk update

# Install X11 and basic tools
apk add xorg-server xorg-input-drivers xorg-video-drivers
apk add openbox xterm
apk add dbus elogind polkit-elogind

# Install Shotcut dependencies
apk add shotcut

# Install additional useful tools
apk add firefox-esr  # For testing
apk add pavucontrol pulseaudio  # Audio
apk add dbus-x11

# Configure X11 to start automatically
cat > /root/.xinitrc << 'EOF'
#!/bin/sh
exec openbox-session
EOF
chmod +x /root/.xinitrc

# Configure Openbox autostart
mkdir -p /root/.config/openbox
cat > /root/.config/openbox/autostart << 'EOF'
#!/bin/sh
# Start D-Bus
dbus-launch --exit-with-session &
# Start Shotcut (optional - uncomment if wanted)
# shotcut &
EOF
chmod +x /root/.config/openbox/autostart

# Enable services
rc-update add dbus default
rc-update add elogind default

echo ""
echo "=== Installation Complete ==="
echo "To start GUI: startx"
echo "Shotcut is installed and ready"
