; DESCRIPTION: Draws a magenta circle centered at (88, 62) with radius 44.
; PLAN: r0=88(x), r1=62(y), r2=44(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 88
LDI r1, 62
LDI r2, 44
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
