; DESCRIPTION: Renders a orange disk with center (423, 87) and radius 80.
; PLAN: r0=423(x), r1=87(y), r2=80(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 423
LDI r1, 87
LDI r2, 80
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
