; DESCRIPTION: Renders a black disk with center (466, 162) and radius 41.
; PLAN: r0=466(x), r1=162(y), r2=41(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 466
LDI r1, 162
LDI r2, 41
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
