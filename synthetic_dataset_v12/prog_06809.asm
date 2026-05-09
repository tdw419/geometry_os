; DESCRIPTION: Draws a blue circle centered at (73, 155) with radius 36.
; PLAN: r0=73(x), r1=155(y), r2=36(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 73
LDI r1, 155
LDI r2, 36
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
