; DESCRIPTION: Renders a black disk with center (89, 104) and radius 71.
; PLAN: r0=89(x), r1=104(y), r2=71(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 89
LDI r1, 104
LDI r2, 71
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
