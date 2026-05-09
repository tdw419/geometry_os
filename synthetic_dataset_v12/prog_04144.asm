; DESCRIPTION: Creates a green circular shape at (194, 86) with radius 37.
; PLAN: r0=194(x), r1=86(y), r2=37(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 194
LDI r1, 86
LDI r2, 37
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
