; DESCRIPTION: Renders a orange disk with center (389, 61) and radius 15.
; PLAN: r0=389(x), r1=61(y), r2=15(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 389
LDI r1, 61
LDI r2, 15
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
