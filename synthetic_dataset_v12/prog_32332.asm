; DESCRIPTION: Creates a purple circular shape at (411, 102) with radius 14.
; PLAN: r0=411(x), r1=102(y), r2=14(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 411
LDI r1, 102
LDI r2, 14
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
