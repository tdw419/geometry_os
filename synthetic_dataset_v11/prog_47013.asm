; DESCRIPTION: Creates a green circular shape at (78, 140) with radius 65.
; PLAN: r0=78(x), r1=140(y), r2=65(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 78
LDI r1, 140
LDI r2, 65
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
