; DESCRIPTION: Creates a purple circular shape at (133, 100) with radius 19.
; PLAN: r0=133(x), r1=100(y), r2=19(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 133
LDI r1, 100
LDI r2, 19
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
