; DESCRIPTION: Draws a magenta cross in the center of the screen (horizontal + vertical lines).ext: r0=0(x), r1=17(y), r2=0(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 0
LDI r1, 17
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
