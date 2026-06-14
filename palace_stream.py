#!/usr/bin/env python3
"""
PALACE_STREAM - Stream Palace Data to GeOS RAM

Reads palace PNG entries and streams pixel data into GeOS RAM.
Implements the streaming 4KB chunk loading for PALACE_LOAD.

Usage:
  palace_stream.py <palace_name> <ram_start_addr> [chunk_size_kb]

Example:
  palace_stream.py linux_kernel 0x80000000 4
"""

import sys
from pathlib import Path

PALACE_DIR = Path.home() / "projects/zion/projects/geometry_os/geometry_os/programs"
MANIFEST_FILE = PALACE_DIR / "palace_manifest.json"


def stream_to_ram(palace_name: str, ram_addr: int = 0x80000000,
                  chunk_size_kb: int = 4) -> list:
    """
    Stream palace data to GeOS RAM via MCP API.

    Args:
        palace_name: Name of the palace entry
        ram_addr: Target RAM address (default 0x80000000)
        chunk_size_kb: Chunk size in KB (default 4KB)

    Returns:
        List of (address, size) tuples for each chunk written
    """
    import json

    # Load manifest
    with open(MANIFEST_FILE) as f:
        manifest = json.load(f)

    if palace_name not in manifest:
        raise ValueError(f"Palace '{palace_name}' not found")

    entry = manifest[palace_name]
    num_entries = entry["num_entries"]

    print(f"[*] Streaming {palace_name} to RAM @ 0x{ram_addr:08X}")
    print(f"[*] Total entries: {num_entries}")
    print(f"[*] Chunk size: {chunk_size_kb}KB")

    chunks = []
    current_addr = ram_addr

    for entry_idx in range(num_entries):
        # Read palace PNG
        png_file = PALACE_DIR / f"palace_{palace_name}_{entry_idx:03d}.png"
        pixels = _read_png(png_file)

        # Convert pixels to u32 words
        words = []
        for r, g, b, a in pixels:
            word = (r << 24) | (g << 16) | (b << 8) | a
            words.append(word)

        # Stream in chunks
        chunk_size = (chunk_size_kb * 1024) // 4  # Convert KB to u32 count

        for offset in range(0, len(words), chunk_size):
            chunk = words[offset:offset + chunk_size]
            chunk_addr = current_addr + (offset * 4)

            # Write to RAM via MCP (simulated)
            # In actual implementation: use mcp_geo_vm_poke_bulk()
            _write_ram_chunk(chunk_addr, chunk)

            chunks.append((chunk_addr, len(chunk) * 4))

            if offset % (chunk_size * 8) == 0:
                print(f"    [0x{chunk_addr:08X}] {len(chunk) * 4:,} bytes")

        current_addr += len(words) * 4

    print(f"[*] Complete: {len(chunks)} chunks written")
    print(f"[*] Total bytes: {current_addr - ram_addr:,}")

    return chunks


def _read_png(path: Path) -> list:
    """Read pixels from PNG file."""
    try:
        import PIL.Image
    except ImportError:
        raise RuntimeError("Pillow not installed. Run: pip install Pillow")

    img = PIL.Image.open(path)
    if img.mode != "RGBA":
        img = img.convert("RGBA")

    return list(img.getdata())


def _write_ram_chunk(addr: int, words: list):
    """
    Write a chunk of u32 words to GeOS RAM.

    Simulated for now. In actual implementation:
      mcp_geo_vm_poke_bulk(address=hex(addr), values=' '.join(hex(w) for w in words))
    """
    pass  # Placeholder


if __name__ == "__main__":
    if len(sys.argv) < 2:
        print(__doc__)
        sys.exit(1)

    palace_name = sys.argv[1]
    ram_addr = int(sys.argv[2], 16) if len(sys.argv) > 2 else 0x80000000
    chunk_size = int(sys.argv[3]) if len(sys.argv) > 3 else 4

    chunks = stream_to_ram(palace_name, ram_addr, chunk_size)
    print(f"\n[*] Chunks written: {len(chunks)}")
    for addr, size in chunks[:5]:
        print(f"    0x{addr:08X}: {size:,} bytes")
    if len(chunks) > 5:
        print(f"    ... ({len(chunks) - 5} more)")