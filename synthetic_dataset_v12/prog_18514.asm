; DESCRIPTION: Renders a black disk with center (417, 155) and radius 71.
; PLAN: r0=417(x), r1=155(y), r2=71(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 417
LDI r1, 155
LDI r2, 71
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
