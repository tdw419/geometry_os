; DESCRIPTION: Creates a green circular shape at (76, 78) with radius 74.
; PLAN: r0=76(x), r1=78(y), r2=74(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 76
LDI r1, 78
LDI r2, 74
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
