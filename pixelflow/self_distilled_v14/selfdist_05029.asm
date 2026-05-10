; DESCRIPTION: Renders a green circular shape at (359, 89) with radius 73.
; PLAN: r0=359(x), r1=89(y), r2=73(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 359
LDI r1, 89
LDI r2, 73
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
