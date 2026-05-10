; DESCRIPTION: Renders a blue disk with center (41, 189) and radius 19.
; PLAN: r0=41(x), r1=189(y), r2=19(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 41
LDI r1, 189
LDI r2, 19
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
