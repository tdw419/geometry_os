; DESCRIPTION: Renders a black disk with center (77, 125) and radius 26.
; PLAN: r0=77(x), r1=125(y), r2=26(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 77
LDI r1, 125
LDI r2, 26
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
