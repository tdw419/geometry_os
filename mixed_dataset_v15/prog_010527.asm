; DESCRIPTION: Renders a black disk with center (187, 179) and radius 41.
; PLAN: r0=187(x), r1=179(y), r2=41(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 187
LDI r1, 179
LDI r2, 41
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
