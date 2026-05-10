; DESCRIPTION: Creates a purple circular shape at (58, 62) with radius 22.
; PLAN: r0=58(x), r1=62(y), r2=22(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 58
LDI r1, 62
LDI r2, 22
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
