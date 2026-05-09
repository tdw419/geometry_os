; DESCRIPTION: Renders a orange disk with center (325, 156) and radius 78.
; PLAN: r0=325(x), r1=156(y), r2=78(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 325
LDI r1, 156
LDI r2, 78
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
