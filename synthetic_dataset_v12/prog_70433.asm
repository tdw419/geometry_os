; DESCRIPTION: Creates a purple circular shape at (377, 83) with radius 33.
; PLAN: r0=377(x), r1=83(y), r2=33(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 377
LDI r1, 83
LDI r2, 33
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
