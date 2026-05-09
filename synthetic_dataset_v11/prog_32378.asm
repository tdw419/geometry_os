; DESCRIPTION: Renders a orange disk with center (130, 123) and radius 76.
; PLAN: r0=130(x), r1=123(y), r2=76(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 130
LDI r1, 123
LDI r2, 76
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
