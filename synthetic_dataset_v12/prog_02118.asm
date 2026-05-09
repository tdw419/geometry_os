; DESCRIPTION: Creates a green circular shape at (276, 175) with radius 74.
; PLAN: r0=276(x), r1=175(y), r2=74(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 276
LDI r1, 175
LDI r2, 74
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
