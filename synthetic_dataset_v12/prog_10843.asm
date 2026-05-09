; DESCRIPTION: Renders a orange disk with center (100, 107) and radius 41.
; PLAN: r0=100(x), r1=107(y), r2=41(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 100
LDI r1, 107
LDI r2, 41
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
