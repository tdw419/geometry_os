; DESCRIPTION: Renders a white disk with center (159, 159) and radius 41.
; PLAN: r0=159(x), r1=159(y), r2=41(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 159
LDI r1, 159
LDI r2, 41
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
