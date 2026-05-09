; DESCRIPTION: Renders a orange disk with center (117, 192) and radius 62.
; PLAN: r0=117(x), r1=192(y), r2=62(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 117
LDI r1, 192
LDI r2, 62
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
