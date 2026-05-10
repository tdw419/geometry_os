; DESCRIPTION: Creates a purple circular shape at (272, 139) with radius 52.
; PLAN: r0=272(x), r1=139(y), r2=52(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 272
LDI r1, 139
LDI r2, 52
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
