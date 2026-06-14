#!/bin/bash
# setup_baremetal_boot.sh - Configures Pixel Linux to boot into Geometry OS on bare metal

set -e

echo "=== Configuring Bare Metal Geometry OS on Pixel Linux ==="

# 1. Compile host binaries for target architecture (x86_64)
echo "Building Geometry OS target..."
cargo build --release --bin geometry_os

# 2. Create the Memory Palace mount point
echo "Creating mount points..."
sudo mkdir -p /mnt/memory_palace
sudo chmod 777 /mnt/memory_palace

# 3. Create a Systemd service file for Palace FUSE filesystem
echo "Creating systemd unit for Palace FUSE..."
cat << 'EOF' | sudo tee /etc/systemd/system/palace-fuse.service
[Unit]
Description=Memory Palace FUSE Storage Service
After=local-fs.target

[Service]
Type=simple
WorkingDirectory=/home/jericho/projects/zion/projects/geometry_os/geometry_os
ExecStart=/usr/bin/python3 palace_fuse.py /mnt/memory_palace
Restart=always
User=jericho

[Install]
WantedBy=multi-user.target
EOF

# 4. Create a Systemd service to launch the primary spatial desktop (geometry_os with framebuffer)
echo "Creating systemd unit for spatial desktop..."
cat << 'EOF' | sudo tee /etc/systemd/system/geos-desktop.service
[Unit]
Description=Geometry OS Spatial Framebuffer Desktop
After=palace-fuse.service
Conflicts=getty@tty1.service

[Service]
Type=simple
WorkingDirectory=/home/jericho/projects/zion/projects/geometry_os/geometry_os
ExecStart=/home/jericho/projects/zion/projects/geometry_os/geometry_os/target/release/geometry_os --framebuffer
StandardInput=tty-force
StandardOutput=inherit
StandardError=inherit
TTYPath=/dev/tty1
User=jericho
Environment=XDG_RUNTIME_DIR=/run/user/1000

[Install]
WantedBy=multi-user.target
EOF

# 5. Enable services
echo "Enabling services..."
sudo systemctl daemon-reload
sudo systemctl enable palace-fuse.service
sudo systemctl enable geos-desktop.service

echo "✓ Bare metal configuration complete!"
echo "Upon reboot, Pixel Linux will automatically mount the FUSE storage and launch the compositor on tty1."
