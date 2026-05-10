; DESCRIPTION: Renders a orange disk with center (204, 89) and radius 78.
; PLAN: r0=204(x), r1=89(y), r2=78(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 204
LDI r1, 89
LDI r2, 78
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
