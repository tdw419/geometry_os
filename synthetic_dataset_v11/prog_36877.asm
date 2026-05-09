; DESCRIPTION: Renders a blue disk with center (205, 41) and radius 41.
; PLAN: r0=205(x), r1=41(y), r2=41(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 205
LDI r1, 41
LDI r2, 41
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
