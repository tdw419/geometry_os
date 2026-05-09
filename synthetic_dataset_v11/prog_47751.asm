; DESCRIPTION: Draws a magenta circle centered at (84, 97) with radius 79.
; PLAN: r0=84(x), r1=97(y), r2=79(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 84
LDI r1, 97
LDI r2, 79
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
