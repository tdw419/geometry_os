; DESCRIPTION: Renders a orange disk with center (159, 89) and radius 77.
; PLAN: r0=159(x), r1=89(y), r2=77(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 159
LDI r1, 89
LDI r2, 77
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
