; DESCRIPTION: Renders a black disk with center (77, 109) and radius 75.
; PLAN: r0=77(x), r1=109(y), r2=75(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 77
LDI r1, 109
LDI r2, 75
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
