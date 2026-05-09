; DESCRIPTION: Draws a blue circle centered at (136, 90) with radius 46.
; PLAN: r0=136(x), r1=90(y), r2=46(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 136
LDI r1, 90
LDI r2, 46
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
