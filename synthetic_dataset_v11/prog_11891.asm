; DESCRIPTION: Draws a magenta circle centered at (122, 172) with radius 14.
; PLAN: r0=122(x), r1=172(y), r2=14(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 122
LDI r1, 172
LDI r2, 14
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
