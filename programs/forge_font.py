import struct

# 3x5 Font Bitmasks (Encoded as u32)
# Layout: Bit 0 is Top-Left, Bit 14 is Bottom-Right (row-major)
FONT = {
    'A': 0b111101111101101,
    'B': 0b110101110101110,
    'C': 0b111100100100111,
    'D': 0b110101101101110,
    'E': 0b111010111011111,
    'F': 0b111100110100100,
    'G': 0b111100101101111,
    'H': 0b101101111101101,
    'I': 0b111010010010111,
    'J': 0b001001001101011,
    'K': 0b101101110101101,
    'L': 0b100100100100111,
    'M': 0b101111101101101,
    'N': 0b111101101101101,
    'O': 0b111101101101111,
    'P': 0b111101111100100,
    'S': 0b111100111001111,
    'T': 0b111010010010010,
    'U': 0b101101101101111,
    'V': 0b101101101101010,
    '0': 0b111101101101111,
    '1': 0b010110010010111,
}

# Constants
GLYPH_WIDTH = 3
GLYPH_HEIGHT = 5
GLYPH_BIT_COUNT = GLYPH_WIDTH * GLYPH_HEIGHT  # 15 bits


def get_pixel(mask, col, row):
    """
    Extract a single pixel from a glyph bitmask.
    
    Args:
        mask: 15-bit bitmask representing the glyph
        col: column (0-2)
        row: row (0-4)
    
    Returns:
        1 if pixel is on, 0 if pixel is off
    
    Bit layout: bit 0 is top-left, bit 14 is bottom-right (row-major)
    Bit position = row * 3 + col
    """
    if col < 0 or col >= GLYPH_WIDTH:
        raise ValueError(f"Column {col} out of range [0, {GLYPH_WIDTH-1}]")
    if row < 0 or row >= GLYPH_HEIGHT:
        raise ValueError(f"Row {row} out of range [0, {GLYPH_HEIGHT-1}]")
    
    bit_position = row * GLYPH_WIDTH + col
    return (mask >> bit_position) & 1


def get_char_pixel(char, col, row):
    """
    Extract a pixel for a given character at (col, row).
    
    Args:
        char: character to look up
        col: column (0-2)
        row: row (0-4)
    
    Returns:
        1 if pixel is on, 0 if pixel is off
    
    Raises:
        KeyError: if character not in font
    """
    if char not in FONT:
        raise KeyError(f"Character '{char}' not in font")
    return get_pixel(FONT[char], col, row)


def encode_glyph(pixels):
    """
    Encode a 3x5 grid of pixels into a 15-bit bitmask.
    
    Args:
        pixels: list of 5 lists, each with 3 values (0 or 1)
                pixels[row][col] format
    
    Returns:
        15-bit bitmask
    """
    mask = 0
    for row in range(GLYPH_HEIGHT):
        for col in range(GLYPH_WIDTH):
            if pixels[row][col]:
                bit_position = row * GLYPH_WIDTH + col
                mask |= (1 << bit_position)
    return mask


def forge_atlas():
    # Glyph Stratum starts at address 320
    # We map ASCII 'A' (65) to index 320 + 65
    atlas = [0] * 1024

    for char, mask in FONT.items():
        addr = 320 + ord(char)
        atlas[addr] = mask

    with open("programs/font_atlas.rts", "wb") as f:
        for p in atlas:
            f.write(struct.pack("<I", p))
    print("Font Atlas forged at programs/font_atlas.rts")

if __name__ == "__main__":
    forge_atlas()
