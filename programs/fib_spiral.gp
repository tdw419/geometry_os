# Fibonacci spiral -- draws fibonacci numbers as pixels
# This is a .gp file (geo-program) compiled by pixelc

x = 1
y = 1
count = 0

while count < 20:
    pixel(x, count, 0x41)
    z = x + y
    x = y
    y = z
    count = count + 1

halt()
