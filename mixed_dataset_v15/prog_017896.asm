; DESCRIPTION: Renders a orange disk with center (111, 123) and radius 21.
; PLAN: r0=111(x), r1=123(y), r2=21(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 111
LDI r1, 123
LDI r2, 21
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
