# Fireworks -- expanding starburst animation
# 8 bursts, each expands a diamond pattern from a random center
# No physics simulation -- pure geometric expansion, safe from u32 overflow
# Data stored at ram[2000+] to avoid overlapping program code

frames = 0
seed = 42

while frames < 320:
    # Launch new burst every 40 frames
    check = frames % 40
    if check == 0:
        # Random center in upper-middle area of screen
        t = seed * 17
        seed = (t + 5) & 0xFFFF
        cx = (seed & 127) + 64
        t = seed * 17
        seed = (t + 5) & 0xFFFF
        cy = (seed & 63) + 20
        ram[2000] = cx
        ram[2001] = cy
        ram[2002] = 1
        ram[2003] = 1

    # Read burst state
    cx = ram[2000]
    cy = ram[2001]
    r = ram[2002]
    active = ram[2003]

    if active == 1:
        if r <= 30:
            # Bright flash at center on first frame
            if r == 1:
                pixel(cx, cy, 255)

            # Color fades from bright (250) to dim (105)
            color = 255 - r * 5

            # Cardinal points: right, left, down, up
            px = cx + r
            if px < 256:
                pixel(px, cy, color)
            if cx >= r:
                pixel(cx - r, cy, color)
            py = cy + r
            if py < 256:
                pixel(cx, py, color)
            if cy >= r:
                pixel(cx, cy - r, color)

            # Diagonal points at half radius
            dr = r >> 1
            if dr > 0:
                # Upper-right diagonal
                if cx + dr < 256:
                    if cy >= dr:
                        pixel(cx + dr, cy - dr, color)
                # Upper-left diagonal
                if cx >= dr:
                    if cy >= dr:
                        pixel(cx - dr, cy - dr, color)
                # Lower-right diagonal
                if cx + dr < 256:
                    if cy + dr < 256:
                        pixel(cx + dr, cy + dr, color)
                # Lower-left diagonal
                if cx >= dr:
                    if cy + dr < 256:
                        pixel(cx - dr, cy + dr, color)

            # Intermediate points at 3/4 radius for denser star
            ir = r * 3
            ir = ir >> 2
            if ir > 0:
                if ir != dr:
                    # Upper-right intermediate
                    if cx + ir < 256:
                        if cy >= ir:
                            pixel(cx + ir, cy - ir, color)
                    # Lower-right intermediate
                    if cx + ir < 256:
                        if cy + ir < 256:
                            pixel(cx + ir, cy + ir, color)
                    # Upper-left intermediate
                    if cx >= ir:
                        if cy >= ir:
                            pixel(cx - ir, cy - ir, color)
                    # Lower-left intermediate
                    if cx >= ir:
                        if cy + ir < 256:
                            pixel(cx - ir, cy + ir, color)

            ram[2002] = r + 1
        else:
            ram[2003] = 0

    frames = frames + 1

halt()
