; DESCRIPTION: Renders a purple disk with center (441, 105) and radius 41.
; PLAN: r0=441(x), r1=105(y), r2=41(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 441
LDI r1, 105
LDI r2, 41
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
