; DESCRIPTION: Creates a purple circular shape at (155, 170) with radius 23.
; PLAN: r0=155(x), r1=170(y), r2=23(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 155
LDI r1, 170
LDI r2, 23
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
