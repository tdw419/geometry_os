; DESCRIPTION: Renders a orange disk with center (84, 169) and radius 75.
; PLAN: r0=84(x), r1=169(y), r2=75(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 84
LDI r1, 169
LDI r2, 75
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
