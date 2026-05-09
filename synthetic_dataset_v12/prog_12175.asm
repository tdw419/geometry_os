; DESCRIPTION: Creates a purple circular shape at (148, 102) with radius 31.
; PLAN: r0=148(x), r1=102(y), r2=31(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 148
LDI r1, 102
LDI r2, 31
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
