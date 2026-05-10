; DESCRIPTION: Renders a orange disk with center (97, 145) and radius 30.
; PLAN: r0=97(x), r1=145(y), r2=30(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 97
LDI r1, 145
LDI r2, 30
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
