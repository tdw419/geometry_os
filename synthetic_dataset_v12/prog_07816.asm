; DESCRIPTION: Creates a green circular shape at (331, 176) with radius 66.
; PLAN: r0=331(x), r1=176(y), r2=66(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 331
LDI r1, 176
LDI r2, 66
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
