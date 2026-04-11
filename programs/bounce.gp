# Bouncing ball demo -- draws a ball that bounces off walls
# Demonstrates: variables, while loop, if/else, arithmetic, drawing

x = 10
y = 10
dx = 3
dy = 2

steps = 0

while steps < 200:
    # Clear old position (draw black)
    pixel(x, y, 0)

    # Move
    x = x + dx
    y = y + dy

    # Bounce off right wall (x >= 200)
    if x >= 200:
        dx = 0 - dx
        x = x + dx

    # Bounce off bottom wall (y >= 200)
    if y >= 200:
        dy = 0 - dy
        y = y + dy

    # Bounce off left wall (x < 3)
    if x < 3:
        dx = 0 - dx
        x = x + dx

    # Bounce off top wall (y < 3)
    if y < 3:
        dy = 0 - dy
        y = y + dy

    # Draw new position (bright pixel)
    pixel(x, y, 0x41)

    steps = steps + 1

halt()
