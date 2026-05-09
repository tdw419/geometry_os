; DESCRIPTION: Creates a purple circular shape at (258, 184) with radius 61.
; PLAN: r0=258(x), r1=184(y), r2=61(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 258
LDI r1, 184
LDI r2, 61
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
