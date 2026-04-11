# Maze generation: green walls on black background
# 16x16 grid of 16x16 cells with 1px thick walls
# Simple random wall removal creates passages between cells
# Safe PRNG: seed * 17 + 5 (no u32 overflow)

# Draw vertical grid lines (x = 0, 16, 32, ..., 240)
lx = 0
while lx < 256:
    ly = 0
    while ly < 256:
        pixel(lx, ly, 0x41)
        ly = ly + 1
    lx = lx + 16

# Right border at x = 255
ly = 0
while ly < 256:
    pixel(255, ly, 0x41)
    ly = ly + 1

# Draw horizontal grid lines (y = 0, 16, 32, ..., 240)
ly = 0
while ly < 256:
    lx = 0
    while lx < 256:
        pixel(lx, ly, 0x41)
        lx = lx + 1
    ly = ly + 16

# Bottom border at y = 255
lx = 0
while lx < 256:
    pixel(lx, 255, 0x41)
    lx = lx + 1

# Randomly remove internal wall segments to create passages
# For each cell, open either the right wall or the bottom wall
seed = 42
gy = 0
while gy < 15:
    gx = 0
    while gx < 15:
        # Safe LCG PRNG
        t = seed * 17
        seed = (t + 5) & 0xFFFF
        d = seed % 2

        if d == 0:
            # Remove right wall: erase 14 pixels at x = (gx+1)*16
            wx = (gx + 1) * 16
            wy = gy * 16 + 1
            i = 0
            while i < 14:
                pixel(wx, wy, 0)
                wy = wy + 1
                i = i + 1
        else:
            # Remove bottom wall: erase 14 pixels at y = (gy+1)*16
            wx = gx * 16 + 1
            wy = (gy + 1) * 16
            i = 0
            while i < 14:
                pixel(wx, wy, 0)
                wx = wx + 1
                i = i + 1

        gx = gx + 1
    gy = gy + 1

halt()
