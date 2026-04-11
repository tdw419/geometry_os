# Fireworks -- scattered colored pixel bursts
# Simple approach: for each burst, draw colored pixels
# in an expanding pattern from a random center

burst = 0
seed = 777

while burst < 5:
    # Pseudorandom center
    t = seed * 17
    seed = (t + 5) & 0xFFFF
    cx = (seed & 127) + 64

    t = seed * 13
    seed = (t + 11) & 0xFFFF
    cy = (seed & 63) + 80

    # Draw concentric diamond rings expanding outward
    r = 2
    while r < 25:
        # Pick color based on radius
        color = (r * 10) + 40
        # Top
        pixel(cx, cy - r, color)
        # Bottom
        pixel(cx, cy + r, color)
        # Left
        pixel(cx - r, cy, color)
        # Right
        pixel(cx + r, cy, color)
        # Diagonals
        pixel(cx + r, cy - r, color)
        pixel(cx - r, cy - r, color)
        pixel(cx + r, cy + r, color)
        pixel(cx - r, cy + r, color)
        r = r + 3

    burst = burst + 1

halt()
