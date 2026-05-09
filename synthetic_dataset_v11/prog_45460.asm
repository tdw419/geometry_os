; DESCRIPTION: Draws a blue circle centered at (78, 155) with radius 12.
; PLAN: r0=78(x), r1=155(y), r2=12(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 78
LDI r1, 155
LDI r2, 12
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
