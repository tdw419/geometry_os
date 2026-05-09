; DESCRIPTION: Creates a purple circular shape at (381, 122) with radius 30.
; PLAN: r0=381(x), r1=122(y), r2=30(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 381
LDI r1, 122
LDI r2, 30
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
