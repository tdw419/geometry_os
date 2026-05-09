; DESCRIPTION: Renders a black disk with center (483, 110) and radius 25.
; PLAN: r0=483(x), r1=110(y), r2=25(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 483
LDI r1, 110
LDI r2, 25
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
