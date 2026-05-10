; DESCRIPTION: Creates a purple circular shape at (356, 144) with radius 69.
; PLAN: r0=356(x), r1=144(y), r2=69(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 356
LDI r1, 144
LDI r2, 69
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
