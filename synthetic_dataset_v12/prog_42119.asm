; DESCRIPTION: Creates a green circular shape at (406, 105) with radius 31.
; PLAN: r0=406(x), r1=105(y), r2=31(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 406
LDI r1, 105
LDI r2, 31
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
