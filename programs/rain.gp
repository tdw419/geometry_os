# Rain animation -- falling pixel drops
# 20 drops with variable speed, 500 frames
# Drop data at ram[700+]: ram[700+i*3] = x, ram[700+i*3+1] = y, ram[700+i*3+2] = speed

frames = 0
seed = 42
base_addr = 700

# Initialize 20 drops
d = 0
while d < 20:
    t = seed * 17
    seed = (t + 5) & 0xFFFF
    x = seed & 0xFF
    base = base_addr + d * 3
    ram[base] = x
    ram[base + 1] = 0
    t = seed * 13
    seed = (t + 7) & 0xFFFF
    spd = (seed % 3) + 1
    ram[base + 2] = spd
    d = d + 1

# Animation loop
while frames < 500:
    d = 0
    while d < 20:
        base = base_addr + d * 3
        x = ram[base]
        y = ram[base + 1]
        spd = ram[base + 2]
        y = y + spd
        if y >= 256:
            y = 0
            t = seed * 17
            seed = (t + 5) & 0xFFFF
            x = seed & 0xFF
            ram[base] = x
        ram[base + 1] = y
        pixel(x, y, 0x3F)
        d = d + 1
    yield()
    frames = frames + 1

halt()
