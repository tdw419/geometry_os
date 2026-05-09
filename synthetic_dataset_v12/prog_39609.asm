; DESCRIPTION: Renders a orange disk with center (188, 101) and radius 37.
; PLAN: r0=188(x), r1=101(y), r2=37(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 188
LDI r1, 101
LDI r2, 37
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
