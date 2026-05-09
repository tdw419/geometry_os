; DESCRIPTION: Renders a black disk with center (102, 80) and radius 41.
; PLAN: r0=102(x), r1=80(y), r2=41(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 102
LDI r1, 80
LDI r2, 41
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
