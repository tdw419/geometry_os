; DESCRIPTION: Renders a orange disk with center (137, 137) and radius 75.
; PLAN: r0=137(x), r1=137(y), r2=75(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 137
LDI r1, 137
LDI r2, 75
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
