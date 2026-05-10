; DESCRIPTION: Renders a orange disk with center (155, 41) and radius 37.
; PLAN: r0=155(x), r1=41(y), r2=37(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 155
LDI r1, 41
LDI r2, 37
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
