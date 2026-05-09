; DESCRIPTION: Creates a green circular shape at (97, 110) with radius 70.
; PLAN: r0=97(x), r1=110(y), r2=70(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 97
LDI r1, 110
LDI r2, 70
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
