; DESCRIPTION: Creates a purple circular shape at (98, 170) with radius 69.
; PLAN: r0=98(x), r1=170(y), r2=69(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 98
LDI r1, 170
LDI r2, 69
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
