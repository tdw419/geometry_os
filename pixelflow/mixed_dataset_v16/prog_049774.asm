; DESCRIPTION: Renders a green disk with center (155, 79) and radius 75.
; PLAN: r0=155(x), r1=79(y), r2=75(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 155
LDI r1, 79
LDI r2, 75
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
