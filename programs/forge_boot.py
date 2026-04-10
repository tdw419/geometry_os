import struct

# Opcode Mapping
OP_LDI = 0x49
OP_RECTF = 0x46
OP_HALT = 0x48

def assemble():
    pixels = []
    
    # --- Step 1: Set Background (Navy) ---
    # LDI r0, 20
    pixels += [OP_LDI, 0, 20]
    # LDI r1, 0
    pixels += [OP_LDI, 1, 0]
    # LDI r2, 0
    pixels += [OP_LDI, 2, 0]
    # RECTF r1, r2, 255, 255
    pixels += [OP_RECTF, 1, 2, 255, 255]

    # --- Step 2: Draw Taskbar (Dark Gray) ---
    # LDI r0, 40
    pixels += [OP_LDI, 0, 40]
    # LDI r2, 240
    pixels += [OP_LDI, 2, 240]
    # RECTF r1, r2, 255, 16
    pixels += [OP_RECTF, 1, 2, 255, 16]

    # --- Step 3: Draw 'G' (White) ---
    # LDI r0, 255
    pixels += [OP_LDI, 0, 255]
    # Top bar
    pixels += [OP_LDI, 1, 10] # x=10
    pixels += [OP_LDI, 2, 10] # y=10
    pixels += [OP_RECTF, 1, 2, 20, 5]
    # Left bar
    pixels += [OP_RECTF, 1, 2, 5, 20]
    # Bottom bar
    pixels += [OP_LDI, 2, 25] # y=25
    pixels += [OP_RECTF, 1, 2, 20, 5]
    # Right notch
    pixels += [OP_LDI, 1, 25] # x=25
    pixels += [OP_LDI, 2, 20] # y=20
    pixels += [OP_RECTF, 1, 2, 5, 10]

    pixels += [OP_HALT]

    # Padding to 32x32 (1024 pixels)
    while len(pixels) < 1024:
        pixels.append(0)

    # Write to programs/boot.rts as little-endian u32
    with open("programs/boot.rts", "wb") as f:
        for p in pixels:
            f.write(struct.pack("<I", p))

    print(f"Assembled {len(pixels)} pixels to programs/boot.rts")
    return pixels

if __name__ == "__main__":
    assemble()
