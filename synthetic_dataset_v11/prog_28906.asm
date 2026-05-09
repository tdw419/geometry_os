; DESCRIPTION: Draws a purple circle centered at (136, 188) with radius 67.
; PLAN: r0=136(x), r1=188(y), r2=67(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 136
LDI r1, 188
LDI r2, 67
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
