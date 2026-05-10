; DESCRIPTION: Renders a orange disk with center (122, 136) and radius 49.
; PLAN: r0=122(x), r1=136(y), r2=49(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 122
LDI r1, 136
LDI r2, 49
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
