; DESCRIPTION: Draws a purple circle centered at (283, 163) with radius 67.
; PLAN: r0=283(x), r1=163(y), r2=67(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 283
LDI r1, 163
LDI r2, 67
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
