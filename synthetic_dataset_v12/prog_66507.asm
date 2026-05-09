; DESCRIPTION: Draws a blue circle centered at (136, 86) with radius 16.
; PLAN: r0=136(x), r1=86(y), r2=16(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 136
LDI r1, 86
LDI r2, 16
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
