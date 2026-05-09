; DESCRIPTION: Renders a orange disk with center (368, 85) and radius 78.
; PLAN: r0=368(x), r1=85(y), r2=78(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 368
LDI r1, 85
LDI r2, 78
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
