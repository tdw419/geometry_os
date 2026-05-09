; DESCRIPTION: Renders a black disk with center (310, 170) and radius 71.
; PLAN: r0=310(x), r1=170(y), r2=71(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 310
LDI r1, 170
LDI r2, 71
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
