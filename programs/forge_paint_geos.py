import struct

# Opcode Mapping
OP_LDI = 0x49
OP_EDIT_OVW = 0x65
OP_HALT = 0x48

def assemble():
    pixels = []
    
    # We will paint 'G' 'E' 'O' 'S' starting at address 320 (Row 10, Col 0)
    target_addr = 320
    
    chars = [ord('G'), ord('E'), ord('O'), ord('S')]
    
    # r0 = target address
    # r1 = character value
    
    for i, char_val in enumerate(chars):
        # LDI r0, target_addr + i
        pixels += [OP_LDI, 0, target_addr + i]
        # LDI r1, char_val
        pixels += [OP_LDI, 1, char_val]
        # EDIT_OVERWRITE r0, r1
        pixels += [OP_EDIT_OVW, 0, 1]

    pixels += [OP_HALT]

    while len(pixels) < 1024:
        pixels.append(0)

    with open("programs/paint_geos.rts", "wb") as f:
        for p in pixels:
            f.write(struct.pack("<I", p))

    print(f"Assembled paint_geos to programs/paint_geos.rts")
    return pixels

if __name__ == "__main__":
    assemble()
