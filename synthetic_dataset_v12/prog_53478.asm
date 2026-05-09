; DESCRIPTION: Renders a black disk with center (93, 125) and radius 50.
; PLAN: r0=93(x), r1=125(y), r2=50(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 93
LDI r1, 125
LDI r2, 50
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
