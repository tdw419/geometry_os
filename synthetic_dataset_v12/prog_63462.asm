; DESCRIPTION: Draws a magenta circle centered at (315, 137) with radius 56.
; PLAN: r0=315(x), r1=137(y), r2=56(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 315
LDI r1, 137
LDI r2, 56
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
