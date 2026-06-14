#!/usr/bin/env python3
"""Create Memory Palace with embedded binaries"""

import json
import base64
from pathlib import Path

# Paths to binaries
kernel_path = Path.home() / ".geometry_os" / "fs" / "linux" / "rv64" / "Image"
initrd_path = Path.home() / ".geometry_os" / "fs" / "linux" / "rv64" / "initramfs.cpio.gz"
disk_path = Path.home() / ".geometry_os" / "vmfs" / "alpine_disk.img"

# Build metadata structure
metadata = {
    "version": 1,
    "buildings": [],
    "coordinates": {}
}

# Function to add binary at coordinate
def add_binary_at_coord(path, coord_x, coord_y, building_id, name, fmt):
    if not path.exists():
        print(f"Warning: {path} not found")
        return None

    binary_data = path.read_bytes()
    checksum = format(sum(binary_data) & 0xFFFFFFFF, "08x")

    coord_key = ((coord_x << 16) | coord_y) & 0xFFFFFFFFFFFFFFFF
    coordinate_data = {
        "x": coord_x,
        "y": coord_y,
        "metadata": {
            "type": "binary_storage",
            "name": name,
            "format": fmt,
            "binary_data": {
                "format": fmt,
                "encoding": "base64",
                "data": base64.b64encode(binary_data).decode("utf-8"),
                "size_bytes": len(binary_data),
                "checksum": checksum,
                "architecture": "riscv64"
            }
        }
    }
    metadata["coordinates"][str(coord_key)] = coordinate_data
    metadata["buildings"].append({
        "id": building_id,
        "world_x": coord_x,
        "world_y": coord_y,
        "type_color": "#00FF00",
        "name": name
    })
    print(f"Added {name}: {len(binary_data)} bytes, checksum={checksum}")
    return building_id

# Add binaries at coordinates
kernel_id = add_binary_at_coord(kernel_path, 10, 10, 42, "alpine-kernel", "elf")
initrd_id = add_binary_at_coord(initrd_path, 10, 12, 43, "alpine-initrd", "cpio")
disk_id = add_binary_at_coord(disk_path, 10, 14, 44, "alpine-disk", "disk_image")

# Save to file
output_path = "memory_palace_with_binaries.json"
with open(output_path, "w") as f:
    json.dump(metadata, f, indent=2)

print(f"\nSaved Memory Palace to: {output_path}")
print(f"Building IDs: kernel={kernel_id}, initrd={initrd_id}, disk={disk_id}")
print(f"\nImport with: import_memory_palace {output_path}")