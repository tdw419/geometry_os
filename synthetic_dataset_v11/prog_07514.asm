; DESCRIPTION: Renders a black disk with center (189, 196) and radius 41.
; PLAN: r0=189(x), r1=196(y), r2=41(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 189
LDI r1, 196
LDI r2, 41
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
