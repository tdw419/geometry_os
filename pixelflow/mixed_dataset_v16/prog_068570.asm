; DESCRIPTION: Creates a purple circular shape at (105, 139) with radius 49.
; PLAN: r0=105(x), r1=139(y), r2=49(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 105
LDI r1, 139
LDI r2, 49
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
