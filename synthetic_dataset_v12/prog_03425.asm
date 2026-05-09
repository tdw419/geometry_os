; DESCRIPTION: Creates a green circular shape at (448, 184) with radius 11.
; PLAN: r0=448(x), r1=184(y), r2=11(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 448
LDI r1, 184
LDI r2, 11
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
