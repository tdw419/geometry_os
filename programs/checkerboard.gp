# Checkerboard pattern using nested-like loop
# Demonstrates: arithmetic, comparison, pixel drawing

y = 0
while y < 64:
    x = 0
    while x < 64:
        sum = x + y
        # if (x + y) % 2 == 0: white, else: dark
        mod_val = sum % 2
        if mod_val == 0:
            pixel(x, y, 0x41)
        else:
            pixel(x, y, 0x20)
        x = x + 1
    y = y + 1

halt()
