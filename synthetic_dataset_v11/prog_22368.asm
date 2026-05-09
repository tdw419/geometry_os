; DESCRIPTION: Renders a black disk with center (75, 115) and radius 18.
; PLAN: r0=75(x), r1=115(y), r2=18(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 75
LDI r1, 115
LDI r2, 18
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
