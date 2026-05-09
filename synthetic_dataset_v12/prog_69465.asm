; DESCRIPTION: Renders a orange disk with center (292, 155) and radius 14.
; PLAN: r0=292(x), r1=155(y), r2=14(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 292
LDI r1, 155
LDI r2, 14
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
