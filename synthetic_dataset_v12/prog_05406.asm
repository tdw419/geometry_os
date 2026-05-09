; DESCRIPTION: Draws a magenta circle centered at (390, 95) with radius 39.
; PLAN: r0=390(x), r1=95(y), r2=39(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 390
LDI r1, 95
LDI r2, 39
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
