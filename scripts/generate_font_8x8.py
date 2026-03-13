#!/usr/bin/env python3
import numpy as np
import os

def generate_font_8x8():
    """
    Generates a 256x256 bit-packed font atlas (8KB).
    Each bit represents one pixel.
    Layout: 32x32 grid of 8x8 cells.
    """
    # Create 256x256 monochrome image
    atlas = np.zeros((256, 256), dtype=bool)
    
    # Fill with some basic patterns for testing
    for i in range(256):
        cell_x = (i % 32) * 8
        cell_y = (i // 32) * 8
        
        # Draw a simple pattern for the character ID
        # Cross for even, border for odd
        if i % 2 == 0:
            for j in range(8):
                atlas[cell_y + j, cell_x + j] = True
                atlas[cell_y + j, cell_x + 7 - j] = True
        else:
            atlas[cell_y, cell_x:cell_x+8] = True
            atlas[cell_y+7, cell_x:cell_x+8] = True
            atlas[cell_y:cell_y+8, cell_x] = True
            atlas[cell_y:cell_y+8, cell_x+7] = True

    # Pack bits into u32 words
    # WGSL logic: let bit = (font_atlas[word_idx] >> (bit_idx % 32u)) & 1u;
    # bit_idx = ay * 256 + ax
    flat = atlas.flatten()
    words = []
    for i in range(0, len(flat), 32):
        word = 0
        for j in range(32):
            if flat[i + j]:
                word |= (1 << j)
        words.append(np.uint32(word))
        
    return np.array(words, dtype=np.uint32).tobytes()

if __name__ == "__main__":
    data = generate_font_8x8()
    output_path = "systems/glyph_stratum/font_8x8.raw"
    with open(output_path, "wb") as f:
        f.write(data)
    print(f"✅ Generated {output_path} (size: {len(data)} bytes)")
