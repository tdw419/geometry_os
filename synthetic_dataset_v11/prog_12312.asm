; DESCRIPTION: Creates a green circular shape at (138, 136) with radius 78.
; PLAN: r0=138(x), r1=136(y), r2=78(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 138
LDI r1, 136
LDI r2, 78
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
