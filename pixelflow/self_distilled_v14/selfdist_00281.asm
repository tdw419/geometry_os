; DESCRIPTION: Renders a green circular shape at (22, 78) with radius 33.
; PLAN: r0=22(x), r1=78(y), r2=33(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 22
LDI r1, 78
LDI r2, 33
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
