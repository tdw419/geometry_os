; DESCRIPTION: Renders a black disk with center (174, 106) and radius 37.
; PLAN: r0=174(x), r1=106(y), r2=37(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 174
LDI r1, 106
LDI r2, 37
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
