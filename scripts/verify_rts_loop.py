#!/usr/bin/env python3
"""
Verify the .rts.png round-trip: compile → PNG → VM RAM → compare.

Usage:
    python3 scripts/verify_rts_loop.py programs/test_rts_minimal.glyph

Exit 0 = parity confirmed, 1 = mismatch.
"""
import sys, struct, subprocess, os

def compile_glyph(src_path):
    """Compile .glyph → .rts.png + .bin via glyph_compiler.py"""
    base = src_path.rsplit('.', 1)[0]
    png_path = base + '.rts.png'
    bin_path = base + '.bin'
    subprocess.check_call(['python3', 'scripts/glyph_compiler.py', src_path, png_path])
    return png_path, bin_path

def read_bin_words(path):
    """Read reference .bin file as list of u32 big-endian words."""
    data = open(path, 'rb').read()
    words = []
    for i in range(0, len(data), 4):
        word = struct.unpack('>I', data[i:i+4])[0]
        words.append(word)
    return words

def extract_png_words(path):
    """Decode .rts.png and extract instruction words (skip header pixel)."""
    from PIL import Image
    img = Image.open(path).convert('RGBA')
    pixels = list(img.getdata())
    # First pixel = word count
    count = (pixels[0][0] << 24) | (pixels[0][1] << 16) | (pixels[0][2] << 8) | pixels[0][3]
    words = []
    for i in range(1, min(1 + count, len(pixels))):
        r, g, b, a = pixels[i]
        word = (r << 24) | (g << 16) | (b << 8) | a
        words.append(word)
    return words

def main():
    if len(sys.argv) < 2:
        print("Usage: verify_rts_loop.py <source.glyph>")
        sys.exit(1)

    src = sys.argv[1]
    os.chdir(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))

    png_path, bin_path = compile_glyph(src)
    bin_words = read_bin_words(bin_path)
    png_words = extract_png_words(png_path)

    if bin_words == png_words:
        print(f"SUCCESS: PNG-to-Binary parity verified for {len(bin_words)} words.")
        sys.exit(0)
    else:
        print(f"FAIL: Mismatch! bin={len(bin_words)} words, png={len(png_words)} words")
        for i, (b, p) in enumerate(zip(bin_words, png_words)):
            if b != p:
                print(f"  Word {i}: bin=0x{b:08X} png=0x{p:08X}")
        sys.exit(1)

if __name__ == '__main__':
    main()
