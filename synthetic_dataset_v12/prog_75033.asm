; DESCRIPTION: Renders a black disk with center (264, 105) and radius 41.
; PLAN: r0=264(x), r1=105(y), r2=41(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 264
LDI r1, 105
LDI r2, 41
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
