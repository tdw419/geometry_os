; DESCRIPTION: Draws a blue circle centered at (200, 136) with radius 36.
; PLAN: r0=200(x), r1=136(y), r2=36(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 200
LDI r1, 136
LDI r2, 36
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
