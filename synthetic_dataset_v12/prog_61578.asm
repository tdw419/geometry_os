; DESCRIPTION: Creates a purple circular shape at (356, 157) with radius 47.
; PLAN: r0=356(x), r1=157(y), r2=47(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 356
LDI r1, 157
LDI r2, 47
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
