; DESCRIPTION: Creates a purple circular shape at (78, 163) with radius 70.
; PLAN: r0=78(x), r1=163(y), r2=70(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 78
LDI r1, 163
LDI r2, 70
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
