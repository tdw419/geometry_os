; DESCRIPTION: Draws a blue circle centered at (90, 136) with radius 59.
; PLAN: r0=90(x), r1=136(y), r2=59(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 90
LDI r1, 136
LDI r2, 59
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
