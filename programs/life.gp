# Conway's Game of Life
# Ported from the canonical Python implementation.
# Uses ram[] as a flat array for the grid (64x64 = 4096 cells).
# Program is loaded at address 0, so grids start well past it.
# Grid A at ram[8192], Grid B at ram[12288].

# Grid dimensions
w = 64
h = 64
size = 4096

# Grid base addresses (past the program code)
grid_a = 8192
grid_b = 12288

# Colors
alive_color = 0x41
dead_color = 0

# Seed: R-pentomino at center
cx = 32
cy = 32

# Pre-compute seed addresses
t = cy - 1
idx = grid_a + t * w + cx
ram[idx] = 1
idx = grid_a + t * w + cx + 1
ram[idx] = 1
idx = grid_a + cy * w + cx - 1
ram[idx] = 1
idx = grid_a + cy * w + cx
ram[idx] = 1
t = cy + 1
idx = grid_a + t * w + cx
ram[idx] = 1

# Glider
idx = grid_a + 3 * w + 2
ram[idx] = 1
idx = grid_a + 4 * w + 3
ram[idx] = 1
idx = grid_a + 5 * w + 1
ram[idx] = 1
idx = grid_a + 5 * w + 2
ram[idx] = 1
idx = grid_a + 5 * w + 3
ram[idx] = 1

# Acorn
idx = grid_a + 8 * w + 2
ram[idx] = 1
idx = grid_a + 9 * w + 4
ram[idx] = 1
idx = grid_a + 10 * w + 1
ram[idx] = 1
idx = grid_a + 10 * w + 2
ram[idx] = 1
idx = grid_a + 10 * w + 5
ram[idx] = 1
idx = grid_a + 10 * w + 6
ram[idx] = 1
idx = grid_a + 10 * w + 7
ram[idx] = 1

# Run for 10 generations
gen = 0
while gen < 10:

    # Compute next generation (skip edges)
    y = 1
    h_limit = h - 1
    w_limit = w - 1
    while y < h_limit:
        x = 1
        while x < w_limit:
            # Pre-compute row bases
            row_above = y - 1
            ra = grid_a + row_above * w
            rs = grid_a + y * w
            row_below = y + 1
            rb = grid_a + row_below * w

            neighbors = 0

            # Count 8 neighbors
            n = ram[ra + x - 1]
            neighbors = neighbors + n
            n = ram[ra + x]
            neighbors = neighbors + n
            n = ram[ra + x + 1]
            neighbors = neighbors + n

            n = ram[rs + x - 1]
            neighbors = neighbors + n
            n = ram[rs + x + 1]
            neighbors = neighbors + n

            n = ram[rb + x - 1]
            neighbors = neighbors + n
            n = ram[rb + x]
            neighbors = neighbors + n
            n = ram[rb + x + 1]
            neighbors = neighbors + n

            # Current cell
            cell_addr = rs + x
            cell = ram[cell_addr]

            # Apply rules
            if cell == 1:
                if neighbors == 2:
                    ram[grid_b + y * w + x] = 1
                else:
                    if neighbors == 3:
                        ram[grid_b + y * w + x] = 1
                    else:
                        ram[grid_b + y * w + x] = 0
            else:
                if neighbors == 3:
                    ram[grid_b + y * w + x] = 1
                else:
                    ram[grid_b + y * w + x] = 0

            x = x + 1
        y = y + 1

    # Copy grid_b to grid_a and draw
    y = 0
    while y < h:
        x = 0
        while x < w:
            idx = y * w + x
            val = ram[grid_b + idx]
            ram[grid_a + idx] = val

            # Draw cell as 4x4 pixel block
            if val == 1:
                px = x * 4
                py = y * 4
                pixel(px, py, alive_color)
                pixel(px + 1, py, alive_color)
                pixel(px + 2, py, alive_color)
                pixel(px + 3, py, alive_color)
                pixel(px, py + 1, alive_color)
                pixel(px + 1, py + 1, alive_color)
                pixel(px + 2, py + 1, alive_color)
                pixel(px + 3, py + 1, alive_color)
                pixel(px, py + 2, alive_color)
                pixel(px + 1, py + 2, alive_color)
                pixel(px + 2, py + 2, alive_color)
                pixel(px + 3, py + 2, alive_color)
                pixel(px, py + 3, alive_color)
                pixel(px + 1, py + 3, alive_color)
                pixel(px + 2, py + 3, alive_color)
                pixel(px + 3, py + 3, alive_color)

            x = x + 1
        y = y + 1

    yield()
    gen = gen + 1

halt()
