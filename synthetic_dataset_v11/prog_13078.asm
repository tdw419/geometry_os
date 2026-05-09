; DESCRIPTION: Creates a purple circular shape at (64, 207) with radius 33.
; PLAN: r0=64(x), r1=207(y), r2=33(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 64
LDI r1, 207
LDI r2, 33
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
