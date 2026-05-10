; DESCRIPTION: Renders a orange disk with center (444, 85) and radius 50.
; PLAN: r0=444(x), r1=85(y), r2=50(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 444
LDI r1, 85
LDI r2, 50
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
