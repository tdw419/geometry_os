; DESCRIPTION: Creates a white circular shape at (318, 86) with radius 75.
; PLAN: r0=318(x), r1=86(y), r2=75(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 318
LDI r1, 86
LDI r2, 75
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
