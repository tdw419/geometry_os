; DESCRIPTION: Draws a blue circle centered at (136, 195) with radius 36.
; PLAN: r0=136(x), r1=195(y), r2=36(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 136
LDI r1, 195
LDI r2, 36
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
