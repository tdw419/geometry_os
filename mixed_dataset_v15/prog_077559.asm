; DESCRIPTION: Renders a black disk with center (423, 159) and radius 79.
; PLAN: r0=423(x), r1=159(y), r2=79(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 423
LDI r1, 159
LDI r2, 79
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
