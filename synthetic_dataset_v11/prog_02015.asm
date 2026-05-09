; DESCRIPTION: Draws a magenta circle centered at (195, 31) with radius 14.
; PLAN: r0=195(x), r1=31(y), r2=14(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 195
LDI r1, 31
LDI r2, 14
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
