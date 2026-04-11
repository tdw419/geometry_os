# Mandelbrot set visualization
# 64x64 grid, fixed-point scale=64
# Maps pixel (px, py) to complex plane c = (px*4 - 128, py*4 - 128) / 64
# Real range: [-2.0, 1.94], Imag range: [-2.0, 1.94]
# Iterates z = z^2 + c up to 16 times
# Colors: 16 for in-set, gradient for escaped

py = 0
while py < 64:
    px = 0
    while px < 64:
        # Map to complex plane (fixed-point, scale 64)
        c_r = px * 4
        c_r = c_r - 128
        c_i = py * 4
        c_i = c_i - 128

        # z = z^2 + c, max 16 iterations
        z_r = 0
        z_i = 0
        it = 0

        while it < 16:
            rr = z_r * z_r
            ii = z_i * z_i
            mag = rr + ii
            if mag <= 16384:
                old_r = z_r
                diff = rr - ii
                z_r = diff >> 6
                z_r = z_r + c_r
                prod = old_r * z_i
                z_i = prod >> 5
                z_i = z_i + c_i
            it = it + 1

        # Color: 16 for in-set, magnitude gradient for escaped
        if mag > 16384:
            color = mag >> 8
        else:
            color = 16
        pixel(px, py, color)

        px = px + 1
    py = py + 1
halt()
