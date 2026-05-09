; DESCRIPTION: Renders a orange disk with center (282, 159) and radius 77.
; PLAN: r0=282(x), r1=159(y), r2=77(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 282
LDI r1, 159
LDI r2, 77
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
