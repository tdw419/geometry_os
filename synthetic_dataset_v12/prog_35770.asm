; DESCRIPTION: Draws a blue circle centered at (451, 81) with radius 14.
; PLAN: r0=451(x), r1=81(y), r2=14(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 451
LDI r1, 81
LDI r2, 14
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
