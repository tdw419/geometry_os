; DESCRIPTION: Draws a magenta cross in the center of the screen (horizontal + vertical lines). Op: r0=0xFF00FF(color). Op: FILL r0.
LDI r0, 0xFF00FFF
FILL r0
HALT
