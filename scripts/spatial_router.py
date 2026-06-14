#!/usr/bin/env python3
import sys
import os
import re
from PIL import Image

# Geometry OS Spatial Router
# Non-destructively migrates host files to Hilbert-mapped .rts.png

TARGET_ZONES = {
    "neural": (0x0000, 0x1000),  # Zone 0: The Hub
    "network": (0x1001, 0x2800), # Zone 1: Primary (I/O)
    "kernel": (0x2801, 0x4000),  # Zone 1: Primary (Logic)
    "media": (0x4001, 0xA000),   # Zone 2: Substrate (Data)
    "junk": (0xA001, 0xFFFF),    # Zone 3: Periphery (Dormant)
}

def d2xy(n, d):
    x, y, t, s = 0, 0, d, 1
    while s < n:
        rx = 1 & (t // 2)
        ry = 1 & (t ^ rx)
        x, y = rot(s, x, y, rx, ry)
        x += s * rx
        y += s * ry
        t //= 4
        s *= 2
    return x, y

def rot(n, x, y, rx, ry):
    if ry == 0:
        if rx == 1:
            x, y = n - 1 - x, n - 1 - y
        return y, x
    return x, y

def migrate_directory(dir_path, category, output_png):
    if category not in TARGET_ZONES:
        print(f"Error: Unknown category {category}")
        return

    start_addr, end_addr = TARGET_ZONES[category]
    img = Image.open(output_png) if os.path.exists(output_png) else Image.new('RGBA', (256, 256), (0,0,0,0))
    
    current_addr = start_addr
    print(f"Migrating {dir_path} to {category} zone ({hex(start_addr)}-{hex(end_addr)})...")

    for root, _, files in os.walk(dir_path):
        for file in sorted(files):
            if current_addr > end_addr:
                print("Warning: Zone capacity exceeded!")
                break
                
            file_path = os.path.join(root, file)
            try:
                with open(file_path, 'rb') as f:
                    data = f.read()
                
                # We store the first 4 bytes of each file as a "Seed Pixel"
                # to represent the file in the spatial map
                if len(data) >= 4:
                    word = struct.unpack('>I', data[:4])[0]
                    x, y = d2xy(256, current_addr)
                    r = (word >> 24) & 0xFF
                    g = (word >> 16) & 0xFF
                    b = (word >> 8) & 0xFF
                    a = 0xFF # Fully opaque active fragment
                    img.putpixel((x, y), (r, g, b, a))
                    current_addr += 1
            except Exception as e:
                print(f"Skipping {file}: {e}")

    img.save(output_png)
    print(f"Migration complete. Used {current_addr - start_addr} Hilbert slots.")

if __name__ == '__main__':
    import struct
    if len(sys.argv) < 4:
        print("Usage: python3 spatial_router.py <dir> <category> <output.rts.png>")
        sys.exit(1)
    
    migrate_directory(sys.argv[1], sys.argv[2], sys.argv[3])
