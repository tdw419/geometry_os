; DESCRIPTION: Renders a green disk with center (120, 178) and radius 41.
; PLAN: r0=120(x), r1=178(y), r2=41(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 120
LDI r1, 178
LDI r2, 41
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
