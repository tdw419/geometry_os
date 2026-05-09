; DESCRIPTION: Draws a blue circle centered at (265, 158) with radius 15.
; PLAN: r0=265(x), r1=158(y), r2=15(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 265
LDI r1, 158
LDI r2, 15
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
