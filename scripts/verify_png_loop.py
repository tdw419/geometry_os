import sys, struct
from PIL import Image

def d2xy(n, d):
    x, y, t, s = 0, 0, d, 1
    while s < n:
        rx = 1 & (t // 2); ry = 1 & (t ^ rx)
        if ry == 0:
            if rx == 1: x, y = s-1-x, s-1-y
            x, y = y, x
        x += s * rx; y += s * ry; t //= 4; s *= 2
    return x, y

def verify_parity(bin_file, png_file):
    with open(bin_file, 'rb') as f:
        original_bc = f.read()
    
    img = Image.open(png_file)
    pixels = img.load()
    
    match = True
    for i in range(0, len(original_bc), 4):
        word_idx = i // 4
        x, y = d2xy(256, word_idx)
        orig_word = struct.unpack('>I', original_bc[i:i+4])[0]
        
        # Handle BIOS flag on first pixel
        r, g, b, a = pixels[x, y]
        pixel_word = (r << 24) | (g << 16) | (b << 8) | a
        
        if word_idx == 0:
            # Strip BIOS flag (Bit 31) for comparison
            pixel_word &= 0x7FFFFFFF
            orig_word &= 0x7FFFFFFF
            
        if orig_word != pixel_word:
            print(f"Mismatch at index {word_idx} (coords {x},{y})")
            print(f"  Source: {hex(orig_word)}")
            print(f"  Pixel:  {hex(pixel_word)}")
            match = False
            break
            
    if match:
        print(f"SUCCESS: PNG-to-Binary parity verified for {len(original_bc)//4} words.")
    return match

if __name__ == '__main__':
    verify_parity(sys.argv[1], sys.argv[2])
