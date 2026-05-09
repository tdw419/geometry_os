; DESCRIPTION: Creates a purple circular shape at (437, 162) with radius 73.
; PLAN: r0=437(x), r1=162(y), r2=73(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 437
LDI r1, 162
LDI r2, 73
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
