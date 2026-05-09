; DESCRIPTION: Renders a black disk with center (273, 170) and radius 35.
; PLAN: r0=273(x), r1=170(y), r2=35(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 273
LDI r1, 170
LDI r2, 35
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
