; DESCRIPTION: Draws a purple circle centered at (67, 83) with radius 31.
; PLAN: r0=67(x), r1=83(y), r2=31(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 67
LDI r1, 83
LDI r2, 31
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
