; DESCRIPTION: Renders a yellow disk with center (433, 84) and radius 41.
; PLAN: r0=433(x), r1=84(y), r2=41(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 433
LDI r1, 84
LDI r2, 41
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
