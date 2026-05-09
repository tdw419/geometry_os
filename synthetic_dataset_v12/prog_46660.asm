; DESCRIPTION: Creates a purple circular shape at (133, 90) with radius 45.
; PLAN: r0=133(x), r1=90(y), r2=45(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 133
LDI r1, 90
LDI r2, 45
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
