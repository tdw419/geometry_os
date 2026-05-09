; DESCRIPTION: Renders a black disk with center (182, 193) and radius 41.
; PLAN: r0=182(x), r1=193(y), r2=41(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 182
LDI r1, 193
LDI r2, 41
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
