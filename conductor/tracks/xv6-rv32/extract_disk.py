#!/usr/bin/env python3
"""
Extract filesystem blocks from stubs_data.h and create disk.img for VirtioBlk.

The stubs_data.h file contains precomputed block data for the xv6 filesystem.
Each block is 1024 bytes (BSIZE). We need to extract these and write them to disk.img.

The disk format is simple: block 0 = boot block, block 1 = superblock, etc.
"""

import re
import struct
import sys

BSIZE = 1024

def parse_stub_blocks(stubs_data_path):
    """Parse stubs_data.h and extract block data."""
    blocks = {}

    with open(stubs_data_path, 'r') as f:
        content = f.read()

    # Find all case N: blocks with their data
    pattern = r'case (\d+):\s*\{\s*static const uchar d\[\] = \{ ([^}]+) \};\s*memmove\(buf, d, BSIZE\);\s*return 1;\s*\}'

    for match in re.finditer(pattern, content, re.MULTILINE):
        block_num = int(match.group(1))
        data_str = match.group(2)

        # Parse hex bytes: 0x40, 0x30, 0x20, 0x10
        bytes_data = []
        for hex_val in data_str.split(','):
            hex_val = hex_val.strip()
            if hex_val:
                bytes_data.append(int(hex_val, 16))

        # Ensure we have BSIZE bytes (1024)
        if len(bytes_data) < BSIZE:
            bytes_data.extend([0] * (BSIZE - len(bytes_data)))
        elif len(bytes_data) > BSIZE:
            bytes_data = bytes_data[:BSIZE]

        blocks[block_num] = bytes_data
        print(f"Parsed block {block_num}: {len(bytes_data)} bytes")

    return blocks

def create_disk_image(blocks, output_path, total_blocks=2000):
    """Create disk.img from parsed blocks."""
    disk = bytearray(total_blocks * BSIZE)

    for block_num, data in blocks.items():
        offset = block_num * BSIZE
        disk[offset:offset + BSIZE] = data
        print(f"Wrote block {block_num} at offset {offset} (0x{offset:X})")

    with open(output_path, 'wb') as f:
        f.write(disk)

    print(f"\nCreated {output_path}: {len(disk)} bytes ({len(disk) // 1024} KB, {len(disk) // BSIZE} blocks)")

def main():
    if len(sys.argv) < 2:
        print("Usage: python3 extract_disk.py <stubs_data.h> [output_path]")
        print("Default output_path: disk.img")
        sys.exit(1)

    stubs_data_path = sys.argv[1]
    output_path = sys.argv[2] if len(sys.argv) > 2 else 'disk.img'

    print(f"Parsing {stubs_data_path}...")
    blocks = parse_stub_blocks(stubs_data_path)

    if not blocks:
        print("ERROR: No blocks found in stubs_data.h")
        sys.exit(1)

    print(f"\nFound {len(blocks)} blocks, creating disk image...")
    create_disk_image(blocks, output_path)

    print(f"\nSuccess! {output_path} is ready for VirtioBlk.")

if __name__ == '__main__':
    main()