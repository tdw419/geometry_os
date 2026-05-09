; DESCRIPTION: Creates a black circular shape at (158, 60) with radius 13.
; PLAN: r0=158(x), r1=60(y), r2=13(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 158
LDI r1, 60
LDI r2, 13
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
