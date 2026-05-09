; DESCRIPTION: Creates a purple circular shape at (142, 62) with radius 46.
; PLAN: r0=142(x), r1=62(y), r2=46(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 142
LDI r1, 62
LDI r2, 46
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
