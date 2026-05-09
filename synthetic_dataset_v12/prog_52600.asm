; DESCRIPTION: Creates a purple circular shape at (76, 141) with radius 56.
; PLAN: r0=76(x), r1=141(y), r2=56(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 76
LDI r1, 141
LDI r2, 56
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
