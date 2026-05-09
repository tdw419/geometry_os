; DESCRIPTION: Renders a black disk with center (155, 77) and radius 65.
; PLAN: r0=155(x), r1=77(y), r2=65(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 155
LDI r1, 77
LDI r2, 65
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
