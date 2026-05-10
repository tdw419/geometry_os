; DESCRIPTION: Creates a green circular shape at (241, 144) with radius 33.
; PLAN: r0=241(x), r1=144(y), r2=33(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 241
LDI r1, 144
LDI r2, 33
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
