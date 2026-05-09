; DESCRIPTION: Renders a black disk with center (319, 75) and radius 36.
; PLAN: r0=319(x), r1=75(y), r2=36(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 319
LDI r1, 75
LDI r2, 36
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
