; DESCRIPTION: Renders a green disk with center (302, 78) and radius 41.
; PLAN: r0=302(x), r1=78(y), r2=41(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 302
LDI r1, 78
LDI r2, 41
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
