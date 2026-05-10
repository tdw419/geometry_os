; DESCRIPTION: Draws a purple circle centered at (192, 78) with radius 23.
; PLAN: r0=192(x), r1=78(y), r2=23(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 192
LDI r1, 78
LDI r2, 23
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
