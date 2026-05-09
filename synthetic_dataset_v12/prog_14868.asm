; DESCRIPTION: Renders a orange disk with center (296, 123) and radius 45.
; PLAN: r0=296(x), r1=123(y), r2=45(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 296
LDI r1, 123
LDI r2, 45
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
