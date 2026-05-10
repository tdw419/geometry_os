; DESCRIPTION: Renders a green circular shape at (124, 89) with radius 58.
; PLAN: r0=124(x), r1=89(y), r2=58(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 124
LDI r1, 89
LDI r2, 58
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
