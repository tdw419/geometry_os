; DESCRIPTION: Renders a orange disk with center (183, 62) and radius 54.
; PLAN: r0=183(x), r1=62(y), r2=54(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 183
LDI r1, 62
LDI r2, 54
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
