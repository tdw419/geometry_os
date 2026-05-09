; DESCRIPTION: Creates a purple circular shape at (76, 124) with radius 73.
; PLAN: r0=76(x), r1=124(y), r2=73(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 76
LDI r1, 124
LDI r2, 73
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
