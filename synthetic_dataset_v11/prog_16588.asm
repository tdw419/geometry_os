; DESCRIPTION: Renders a black disk with center (140, 163) and radius 75.
; PLAN: r0=140(x), r1=163(y), r2=75(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 140
LDI r1, 163
LDI r2, 75
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
