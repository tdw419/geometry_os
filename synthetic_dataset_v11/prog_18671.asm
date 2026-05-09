; DESCRIPTION: Renders a black disk with center (107, 119) and radius 14.
; PLAN: r0=107(x), r1=119(y), r2=14(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 107
LDI r1, 119
LDI r2, 14
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
