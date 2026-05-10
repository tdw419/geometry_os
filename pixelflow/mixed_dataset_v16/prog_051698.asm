; DESCRIPTION: Creates a white circular shape at (390, 175) with radius 29.
; PLAN: r0=390(x), r1=175(y), r2=29(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 390
LDI r1, 175
LDI r2, 29
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
