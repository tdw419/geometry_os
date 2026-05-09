; DESCRIPTION: Draws a blue circle centered at (93, 192) with radius 62.
; PLAN: r0=93(x), r1=192(y), r2=62(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 93
LDI r1, 192
LDI r2, 62
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
