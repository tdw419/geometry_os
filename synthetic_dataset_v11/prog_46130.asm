; DESCRIPTION: Renders a orange disk with center (80, 109) and radius 11.
; PLAN: r0=80(x), r1=109(y), r2=11(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 80
LDI r1, 109
LDI r2, 11
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
