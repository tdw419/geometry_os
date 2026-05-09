; DESCRIPTION: Renders a orange disk with center (120, 170) and radius 37.
; PLAN: r0=120(x), r1=170(y), r2=37(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 120
LDI r1, 170
LDI r2, 37
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
