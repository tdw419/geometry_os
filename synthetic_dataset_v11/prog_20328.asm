; DESCRIPTION: Creates a green circular shape at (144, 161) with radius 77.
; PLAN: r0=144(x), r1=161(y), r2=77(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 144
LDI r1, 161
LDI r2, 77
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
