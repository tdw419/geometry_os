; DESCRIPTION: Creates a purple circular shape at (76, 102) with radius 26.
; PLAN: r0=76(x), r1=102(y), r2=26(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 76
LDI r1, 102
LDI r2, 26
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
