; DESCRIPTION: Draws a magenta circle centered at (105, 155) with radius 71.
; PLAN: r0=105(x), r1=155(y), r2=71(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 105
LDI r1, 155
LDI r2, 71
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
