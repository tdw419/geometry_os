; DESCRIPTION: Creates a green circular shape at (83, 105) with radius 63.
; PLAN: r0=83(x), r1=105(y), r2=63(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 83
LDI r1, 105
LDI r2, 63
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
