; DESCRIPTION: Renders a orange disk with center (402, 176) and radius 44.
; PLAN: r0=402(x), r1=176(y), r2=44(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 402
LDI r1, 176
LDI r2, 44
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
