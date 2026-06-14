#!/usr/bin/env python3
"""Generate a test PNG with a BIOS pixel for Geometry OS boot testing."""

import math
from PIL import Image, PngImagePlugin


def main():
    # Assembly source to encode (will be booted by Geometry OS)
    source = b"HALT\n"

    # Encode source into strategy-A seeds (3 bytes per seed)
    seeds = []
    i = 0
    while i + 3 <= len(source):
        seed = 0xA0000000 | (source[i] << 16) | (source[i + 1] << 8) | source[i + 2]
        seeds.append(seed)
        i += 3
    if len(source) - i >= 2:
        seed = 0xA0000000 | (source[i] << 16) | (source[i + 1] << 8)
        seeds.append(seed)
        i += 2
    elif len(source) > i:
        seed = 0xA0000000 | (source[i] << 16)
        seeds.append(seed)

    # Prepend BIOS pixel
    # 0x9105003C = BIOS | Bytecode mode (1) | 512x512 (1) | audio+mouse (0x05) | 60fps (0x3C)
    bios_seed = 0x9105003C
    seeds = [bios_seed] + seeds

    # Determine image dimensions
    n = len(seeds)
    if n <= 4:
        w, h = 2, 2
    else:
        side = int(math.ceil(math.sqrt(n)))
        w = side
        h = int(math.ceil(n / side))

    # Build RGBA pixel buffer
    pixels = bytearray()
    for idx in range(w * h):
        if idx < n:
            s = seeds[idx]
            pixels.extend([
                (s >> 24) & 0xFF,
                (s >> 16) & 0xFF,
                (s >> 8) & 0xFF,
                s & 0xFF,
            ])
        else:
            pixels.extend([0, 0, 0, 0])

    img = Image.frombytes("RGBA", (w, h), bytes(pixels))

    # PNG metadata
    pnginfo = PngImagePlugin.PngInfo()
    pnginfo.add_text("seedcnt", str(n))
    pnginfo.add_text("bytecnt", str(len(source)))
    pnginfo.add_text("geo_boot", "source")

    out_path = "test_bios.png"
    img.save(out_path, pnginfo=pnginfo)
    print(f"Created {out_path}")
    print(f"  Seeds: {n} (including BIOS pixel)")
    print(f"  Source bytes: {len(source)}")
    print(f"  BIOS: {bios_seed:#010x} (Bytecode, 512x512, audio+mouse, 60fps)")


if __name__ == "__main__":
    main()
