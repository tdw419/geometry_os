; DESCRIPTION: Renders a orange disk with center (189, 119) and radius 35.
; PLAN: r0=189(x), r1=119(y), r2=35(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 189
LDI r1, 119
LDI r2, 35
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
