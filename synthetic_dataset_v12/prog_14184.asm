; DESCRIPTION: Creates a black circular shape at (427, 87) with radius 75.
; PLAN: r0=427(x), r1=87(y), r2=75(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 427
LDI r1, 87
LDI r2, 75
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
