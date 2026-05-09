; DESCRIPTION: Draws a purple circle centered at (136, 72) with radius 47.
; PLAN: r0=136(x), r1=72(y), r2=47(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 136
LDI r1, 72
LDI r2, 47
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
