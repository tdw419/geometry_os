; DESCRIPTION: Draws a magenta circle centered at (227, 87) with radius 64.
; PLAN: r0=227(x), r1=87(y), r2=64(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 227
LDI r1, 87
LDI r2, 64
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
