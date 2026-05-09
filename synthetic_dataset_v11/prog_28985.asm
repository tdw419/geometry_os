; DESCRIPTION: Renders a black disk with center (75, 117) and radius 37.
; PLAN: r0=75(x), r1=117(y), r2=37(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 75
LDI r1, 117
LDI r2, 37
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
