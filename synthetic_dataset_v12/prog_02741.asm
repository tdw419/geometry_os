; DESCRIPTION: Renders a green disk with center (251, 138) and radius 41.
; PLAN: r0=251(x), r1=138(y), r2=41(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 251
LDI r1, 138
LDI r2, 41
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
