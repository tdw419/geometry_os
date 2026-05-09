; DESCRIPTION: Creates a purple circular shape at (339, 124) with radius 24.
; PLAN: r0=339(x), r1=124(y), r2=24(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 339
LDI r1, 124
LDI r2, 24
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
