; DESCRIPTION: Renders a orange disk with center (178, 119) and radius 50.
; PLAN: r0=178(x), r1=119(y), r2=50(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 178
LDI r1, 119
LDI r2, 50
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
