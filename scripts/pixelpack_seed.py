#!/usr/bin/env python3
"""
PixelPack Seed Generator
Turns a 32-bit seed (or hex string) into a GeOS .asm program.

Each seed expands into a visual pattern. Change the seed, change the art.
The 4 billion possible values = the design space.

Usage:
    python3 pixelpack_seed.py <seed> [output.asm]
    python3 pixelpack_seed.py 0xDEADBEEF
    python3 pixelpack_seed.py 123456789
"""

import sys
import random

# ═══════════════════════════════════════════════════════════════
# SEED → VISUAL EXPANSION
# ═══════════════════════════════════════════════════════════════
#
# A 32-bit seed is split into fields that control the generated image:
#
#   bits 31:28 = Pattern type (0-15)
#   bits 27:24 = Color A index (0-15, mapped to palette)
#   bits 23:20 = Color B index (0-15)
#   bits 19:16 = Density / spacing parameter
#   bits 15:8  = X origin / offset
#   bits  7:0  = Y origin / offset
#
# Pattern types:
#   0 = Solid fill (Color A)
#   1 = Horizontal stripes (Color A on Color B)
#   2 = Vertical stripes
#   3 = Checkerboard
#   4 = Border frame
#   5 = Cross / plus sign
#   6 = Diagonal lines
#   7 = Concentric rects
#   8 = Random scatter
#   9 = Gradient bars
#  10 = Diamond pattern
#  11 = Dots grid
#  12 = Border + cross
#  13 = Circular gradient
#  14 = Noise field
#  15 = Four quadrants (A/B/A/B)

PALETTE = [
    0x000000,  # 0  black
    0xFF0000,  # 1  red
    0x00FF00,  # 2  green
    0x0000FF,  # 3  blue
    0xFFFF00,  # 4  yellow
    0xFF00FF,  # 5  magenta
    0x00FFFF,  # 6  cyan
    0xFFFFFF,  # 7  white
    0xFF8800,  # 8  orange
    0x8800FF,  # 9  purple
    0x0088FF,  # 10 sky
    0x88FF00,  # 11 lime
    0xFF0088,  # 12 pink
    0x00FF88,  # 13 mint
    0x888888,  # 14 gray
    0xFF4444,  # 15 light red
]


def expand_seed(seed: int) -> str:
    """Turn a 32-bit seed into GeOS assembly."""
    
    pattern = (seed >> 28) & 0xF
    color_a_idx = (seed >> 24) & 0xF
    color_b_idx = (seed >> 20) & 0xF
    density = ((seed >> 16) & 0xF) + 1   # 1-16
    x_offset = (seed >> 8) & 0xFF
    y_offset = seed & 0xFF
    
    color_a = PALETTE[color_a_idx]
    color_b = PALETTE[color_b_idx]
    
    lines = [
        f"; PixelPack Seed: 0x{seed:08X} ({seed})",
        f"; Pattern={pattern}, ColorA=0x{color_a:06X}, ColorB=0x{color_b:06X}",
        f"; Density={density}, Offset=({x_offset},{y_offset})",
        "",
        "; === Registers ===",
        "LDI r10, 0   ; color A",
        "LDI r11, 0   ; color B",
        "LDI r20, 0   ; temp x",
        "LDI r21, 0   ; temp y",
        "LDI r22, 0   ; temp w",
        "LDI r23, 0   ; temp h",
        "LDI r30, 1   ; const 1",
        "",
    ]
    
    # Helper to emit RECTF
    def rect(x, y, w, h, color_reg):
        return [
            f"LDI r20, {x}",
            f"LDI r21, {y}",
            f"LDI r22, {w}",
            f"LDI r23, {h}",
            f"RECTF r20, r21, r22, r23, r{color_reg}",
        ]
    
    # Set colors
    lines.append(f"LDI r10, 0x{color_a:06X}  ; Color A")
    lines.append(f"LDI r11, 0x{color_b:06X}  ; Color B")
    lines.append("")
    
    # Pattern expansion
    if pattern == 0:
        # Solid fill
        lines.append("; Pattern 0: Solid fill")
        lines.extend(rect(x_offset, y_offset, 256, 256, 10))
        
    elif pattern == 1:
        # Horizontal stripes
        lines.append("; Pattern 1: Horizontal stripes")
        stripe_h = max(8, density * 2)
        lines.extend(rect(0, 0, 256, 256, 11))  # background
        for i in range(0, 256, stripe_h * 2):
            lines.extend(rect(0, i, 256, stripe_h, 10))
        
    elif pattern == 2:
        # Vertical stripes
        lines.append("; Pattern 2: Vertical stripes")
        stripe_w = max(8, density * 2)
        lines.extend(rect(0, 0, 256, 256, 11))  # background
        for i in range(0, 256, stripe_w * 2):
            lines.extend(rect(i, 0, stripe_w, 256, 10))
            
    elif pattern == 3:
        # Checkerboard
        lines.append("; Pattern 3: Checkerboard")
        cell = max(16, density * 8)
        lines.extend(rect(0, 0, 256, 256, 11))  # background
        for row in range(min(16, 256 // cell)):
            for col in range(min(16, 256 // cell)):
                if (row + col) % 2 == 0:
                    cx = (col * cell) % 256
                    cy = (row * cell) % 256
                    lines.extend(rect(cx, cy, cell, cell, 10))
                    
    elif pattern == 4:
        # Border frame
        lines.append("; Pattern 4: Border frame")
        border = max(2, density)
        lines.extend(rect(0, 0, 256, 256, 11))  # background
        lines.extend(rect(0, 0, 256, border, 10))  # top
        lines.extend(rect(0, 256-border, 256, border, 10))  # bottom
        lines.extend(rect(0, 0, border, 256, 10))  # left
        lines.extend(rect(256-border, 0, border, 256, 10))  # right
        
    elif pattern == 5:
        # Cross / plus
        lines.append("; Pattern 5: Cross")
        thick = max(4, density * 2)
        cx = x_offset % 256
        cy = y_offset % 256
        lines.extend(rect(0, 0, 256, 256, 11))  # background
        lines.extend(rect(cx - thick//2, 0, thick, 256, 10))  # vertical
        lines.extend(rect(0, cy - thick//2, 256, thick, 10))  # horizontal
        
    elif pattern == 6:
        # Diagonal lines
        lines.append("; Pattern 6: Diagonal")
        lines.extend(rect(0, 0, 256, 256, 11))  # background
        step = max(8, density * 4)
        for i in range(0, 512, step):
            lines.append(f"LDI r20, {i % 256}")
            lines.append("LDI r21, 0")
            lines.append("LDI r22, 255")
            lines.append(f"LDI r23, {(i + 255) % 256}")
            lines.append("LINE r20, r21, r22, r23, r10")
            
    elif pattern == 7:
        # Concentric rects
        lines.append("; Pattern 7: Concentric rects")
        lines.extend(rect(0, 0, 256, 256, 11))  # background
        step = max(16, density * 8)
        for i in range(0, 128, step):
            sz = 256 - i * 2
            if sz > 0:
                creg = 10 if (i // step) % 2 == 0 else 11
                lines.extend(rect(i, i, sz, sz, creg))
                
    elif pattern == 8:
        # Random scatter (deterministic from seed)
        lines.append("; Pattern 8: Scatter")
        lines.extend(rect(0, 0, 256, 256, 11))  # background
        rng = random.Random(seed)
        count = min(32, density * 2)
        for _ in range(count):
            px = rng.randint(0, 220)
            py = rng.randint(0, 220)
            sz = rng.randint(8, 32)
            creg = 10 if rng.random() > 0.3 else 11
            lines.extend(rect(px, py, sz, sz, creg))
            
    elif pattern == 9:
        # Gradient bars
        lines.append("; Pattern 9: Gradient bars")
        bar_w = max(8, density * 4)
        for i in range(256 // bar_w):
            # Simple brightness step
            bright = min(255, (i * 16) % 256)
            c = (bright << 16) | (bright << 8) | bright
            lines.append(f"LDI r10, 0x{c:06X}")
            lines.extend(rect(i * bar_w, 0, bar_w, 256, 10))
            
    elif pattern == 10:
        # Diamond pattern
        lines.append("; Pattern 10: Diamond")
        lines.extend(rect(0, 0, 256, 256, 11))  # background
        cx, cy = 128, 128
        for r in range(16, 128, density * 4):
            # Draw diamond as 4 lines
            lines.append(f"LDI r20, {cx}")
            lines.append(f"LDI r21, {cy - r}")
            lines.append(f"LDI r22, {cx + r}")
            lines.append(f"LDI r23, {cy}")
            lines.append("LINE r20, r21, r22, r23, r10")
            lines.append(f"LDI r20, {cx + r}")
            lines.append(f"LDI r21, {cy}")
            lines.append(f"LDI r22, {cx}")
            lines.append(f"LDI r23, {cy + r}")
            lines.append("LINE r20, r21, r22, r23, r10")
            lines.append(f"LDI r20, {cx}")
            lines.append(f"LDI r21, {cy + r}")
            lines.append(f"LDI r22, {cx - r}")
            lines.append(f"LDI r23, {cy}")
            lines.append("LINE r20, r21, r22, r23, r10")
            lines.append(f"LDI r20, {cx - r}")
            lines.append(f"LDI r21, {cy}")
            lines.append(f"LDI r22, {cx}")
            lines.append(f"LDI r23, {cy - r}")
            lines.append("LINE r20, r21, r22, r23, r10")
            
    elif pattern == 11:
        # Dots grid
        lines.append("; Pattern 11: Dots grid")
        lines.extend(rect(0, 0, 256, 256, 11))  # background
        spacing = max(16, density * 8)
        dot_size = max(4, spacing // 4)
        max_dots = min(16, 256 // spacing)
        for y in range(max_dots):
            for x in range(max_dots):
                dx = (x * spacing) % 256
                dy = (y * spacing) % 256
                lines.extend(rect(dx, dy, dot_size, dot_size, 10))
                
    elif pattern == 12:
        # Border + cross
        lines.append("; Pattern 12: Border + Cross")
        border = max(2, density)
        thick = max(4, density * 2)
        lines.extend(rect(0, 0, 256, 256, 11))  # background
        lines.extend(rect(0, 0, 256, border, 10))
        lines.extend(rect(0, 256-border, 256, border, 10))
        lines.extend(rect(0, 0, border, 256, 10))
        lines.extend(rect(256-border, 0, border, 256, 10))
        lines.extend(rect(128-thick//2, 0, thick, 256, 10))
        lines.extend(rect(0, 128-thick//2, 256, thick, 10))
        
    elif pattern == 13:
        # Circular gradient (concentric circles)
        lines.append("; Pattern 13: Concentric circles")
        lines.extend(rect(0, 0, 256, 256, 11))  # background
        step = max(4, density * 2)
        for r in range(step, 140, step):
            lines.append(f"LDI r20, 128")
            lines.append(f"LDI r21, 128")
            lines.append(f"LDI r22, {r}")
            lines.append("CIRCLE r20, r21, r22, r10")
            
    elif pattern == 14:
        # Noise field
        lines.append("; Pattern 14: Noise field")
        rng = random.Random(seed)
        cell = max(16, density * 4)
        max_cells = min(16, 256 // cell)
        for y in range(max_cells):
            for x in range(max_cells):
                if rng.random() > 0.5:
                    c = color_a if rng.random() > 0.5 else color_b
                    lines.append(f"LDI r10, 0x{c:06X}")
                    lines.extend(rect(x * cell, y * cell, cell, cell, 10))
                    
    else:  # pattern 15
        # Four quadrants
        lines.append("; Pattern 15: Four quadrants")
        lines.extend(rect(0, 0, 128, 128, 10))
        lines.extend(rect(128, 0, 128, 128, 11))
        lines.extend(rect(0, 128, 128, 128, 11))
        lines.extend(rect(128, 128, 128, 128, 10))
    
    lines.append("")
    lines.append("FRAME")
    lines.append("HALT")
    lines.append("")
    
    return '\n'.join(lines)


def main():
    if len(sys.argv) < 2:
        print(__doc__)
        print("\nExamples:")
        print("  python3 pixelpack_seed.py 0x12345678")
        print("  python3 pixelpack_seed.py 0xDEADBEEF /tmp/out.asm")
        print("  python3 pixelpack_seed.py 42")
        sys.exit(1)
    
    seed_str = sys.argv[1]
    output_file = sys.argv[2] if len(sys.argv) > 2 else None
    
    # Parse seed
    if seed_str.startswith('0x') or seed_str.startswith('0X'):
        seed = int(seed_str, 16)
    else:
        seed = int(seed_str)
    
    # Ensure 32-bit
    seed = seed & 0xFFFFFFFF
    
    asm = expand_seed(seed)
    
    if output_file:
        with open(output_file, 'w') as f:
            f.write(asm)
        print(f"Saved seed 0x{seed:08X} to {output_file}")
    else:
        print(asm)


if __name__ == "__main__":
    main()
