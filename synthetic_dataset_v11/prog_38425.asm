; DESCRIPTION: Creates a purple circular shape at (161, 100) with radius 73.
; PLAN: r0=161(x), r1=100(y), r2=73(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 161
LDI r1, 100
LDI r2, 73
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
