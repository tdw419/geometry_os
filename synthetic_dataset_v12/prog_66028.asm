; DESCRIPTION: Renders a purple disk with center (130, 149) and radius 41.
; PLAN: r0=130(x), r1=149(y), r2=41(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 130
LDI r1, 149
LDI r2, 41
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
