; DESCRIPTION: Creates a black circular shape at (444, 144) with radius 23.
; PLAN: r0=444(x), r1=144(y), r2=23(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 444
LDI r1, 144
LDI r2, 23
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
