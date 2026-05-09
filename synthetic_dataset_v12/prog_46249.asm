; DESCRIPTION: Renders a black disk with center (79, 117) and radius 66.
; PLAN: r0=79(x), r1=117(y), r2=66(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 79
LDI r1, 117
LDI r2, 66
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
