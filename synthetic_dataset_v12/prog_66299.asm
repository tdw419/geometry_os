; DESCRIPTION: Creates a red circular shape at (201, 49) with radius 13.
; PLAN: r0=201(x), r1=49(y), r2=13(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 201
LDI r1, 49
LDI r2, 13
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
