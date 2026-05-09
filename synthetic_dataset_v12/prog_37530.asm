; DESCRIPTION: Creates a black circular shape at (128, 175) with radius 66.
; PLAN: r0=128(x), r1=175(y), r2=66(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 128
LDI r1, 175
LDI r2, 66
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
