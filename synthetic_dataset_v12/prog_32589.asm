; DESCRIPTION: Creates a black circular shape at (406, 175) with radius 75.
; PLAN: r0=406(x), r1=175(y), r2=75(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 406
LDI r1, 175
LDI r2, 75
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
