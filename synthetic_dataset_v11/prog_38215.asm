; DESCRIPTION: Draws a magenta circle centered at (227, 26) with radius 17.
; PLAN: r0=227(x), r1=26(y), r2=17(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 227
LDI r1, 26
LDI r2, 17
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
