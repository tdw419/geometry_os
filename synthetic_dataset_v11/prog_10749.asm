; DESCRIPTION: Creates a green circular shape at (136, 87) with radius 17.
; PLAN: r0=136(x), r1=87(y), r2=17(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 136
LDI r1, 87
LDI r2, 17
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
