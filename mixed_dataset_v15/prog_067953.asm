; DESCRIPTION: Renders a orange disk with center (290, 114) and radius 76.
; PLAN: r0=290(x), r1=114(y), r2=76(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 290
LDI r1, 114
LDI r2, 76
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
