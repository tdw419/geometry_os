; DESCRIPTION: Renders a green circular shape at (83, 110) with radius 25.
; PLAN: r0=83(x), r1=110(y), r2=25(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 83
LDI r1, 110
LDI r2, 25
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
