# Smooth color gradient across the screen
# Demonstrates: nested loops, arithmetic, pixel drawing, color blending
# Creates a 2D gradient: color = (y * 4) + x on a 64x64 grid

y = 0
while y < 64:
    x = 0
    while x < 64:
        # Blend y into upper portion, x into lower portion
        # y*4 keeps values in safe range (max 252 << 0)
        y_part = y * 4
        color = y_part + x
        pixel(x, y, color)
        x = x + 1
    y = y + 1

halt()
