; DESCRIPTION: Creates a purple circular shape at (469, 64) with radius 38.
; PLAN: r0=469(x), r1=64(y), r2=38(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 469
LDI r1, 64
LDI r2, 38
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
