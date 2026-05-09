; DESCRIPTION: Creates a purple circular shape at (100, 157) with radius 80.
; PLAN: r0=100(x), r1=157(y), r2=80(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 100
LDI r1, 157
LDI r2, 80
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
