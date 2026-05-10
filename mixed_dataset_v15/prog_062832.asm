; DESCRIPTION: Draws a magenta circle centered at (477, 211) with radius 26.
; PLAN: r0=477(x), r1=211(y), r2=26(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 477
LDI r1, 211
LDI r2, 26
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
