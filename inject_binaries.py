#!/usr/bin/env python3
"""Directly inject binary data into VM RAM with building metadata"""

import json
import base64
from pathlib import Path

# Load the palace JSON
palace_path = Path("memory_palace_with_binaries.json")
with open(palace_path) as f:
    palace = json.load(f)

# Extract binary metadata for our buildings
building_ids = {42: "alpine-kernel", 43: "alpine-initrd", 44: "alpine-disk"}

# For each building, generate the commands to inject it
print("# Commands to inject binaries into Memory Palace")
print("# Run these while Geometry OS daemon is running\n")

for building_id, name in building_ids.items():
    building_data = next((b for b in palace.get("buildings", []) if b["id"] == building_id), None)
    if not building_data:
        continue

    coord_key = f"{building_data['world_x'] << 16 | building_data['world_y']}"

    # Find coordinate metadata
    coord_data = palace.get("coordinates", {}).get(coord_key)
    if not coord_data:
        continue

    binary_metadata = coord_data.get("metadata", {}).get("binary_data")
    if not binary_metadata:
        continue

    # Create coordinate metadata JSON for CLI
    coord_json = json.dumps(binary_metadata)
    print(f"# Building {building_id}: {name}")
    print(f"# Size: {binary_metadata['size_bytes']} bytes")
    print(f"# Location: ({building_data['world_x']}, {building_data['world_y']})")
    print(f"# Add to RAM manually via:")
    print(f"# 1. Set RAM[0x7500+{building_id}] = 0x{(building_data['world_x'] << 16 | building_data['world_y']):08X}")
    print(f"# 2. Store binary metadata at coordinate ({building_data['world_x']}, {building_data['world_y']})")
    print()

print("\n# Alternative: Boot directly from files (current working method)")
print("echo 'hypervisor_boot arch=riscv64 kernel=~/.geometry_os/fs/linux/rv64/Image initrd=~/.geometry_os/fs/linux/rv64/initramfs.cpio.gz ram=256M disk=~/.geometry_os/vmfs/alpine_disk.img append=console=ttyS0 root=/dev/vda' | nc -U /tmp/geo_cmd.sock")