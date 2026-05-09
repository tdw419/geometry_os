; DESCRIPTION: Draws a purple circle centered at (136, 116) with radius 32.
; PLAN: r0=136(x), r1=116(y), r2=32(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 136
LDI r1, 116
LDI r2, 32
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
