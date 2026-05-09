; DESCRIPTION: Draws a purple circle centered at (192, 192) with radius 35.
; PLAN: r0=192(x), r1=192(y), r2=35(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 192
LDI r1, 192
LDI r2, 35
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
