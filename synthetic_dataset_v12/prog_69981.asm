; DESCRIPTION: Renders a green disk with center (316, 125) and radius 41.
; PLAN: r0=316(x), r1=125(y), r2=41(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 316
LDI r1, 125
LDI r2, 41
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
