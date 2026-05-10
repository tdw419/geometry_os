; DESCRIPTION: Creates a purple circular shape at (60, 170) with radius 17.
; PLAN: r0=60(x), r1=170(y), r2=17(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 60
LDI r1, 170
LDI r2, 17
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
