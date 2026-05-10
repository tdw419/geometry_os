; DESCRIPTION: Renders a green circular shape at (49, 189) with radius 20.
; PLAN: r0=49(x), r1=189(y), r2=20(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 49
LDI r1, 189
LDI r2, 20
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
