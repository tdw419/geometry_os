; DESCRIPTION: Creates a purple circular shape at (217, 139) with radius 74.
; PLAN: r0=217(x), r1=139(y), r2=74(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 217
LDI r1, 139
LDI r2, 74
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
