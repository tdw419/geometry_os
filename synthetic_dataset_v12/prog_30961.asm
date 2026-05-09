; DESCRIPTION: Draws a magenta circle centered at (122, 155) with radius 36.
; PLAN: r0=122(x), r1=155(y), r2=36(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 122
LDI r1, 155
LDI r2, 36
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
