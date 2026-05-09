; DESCRIPTION: Renders a black disk with center (147, 67) and radius 41.
; PLAN: r0=147(x), r1=67(y), r2=41(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 147
LDI r1, 67
LDI r2, 41
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
