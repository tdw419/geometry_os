; DESCRIPTION: Renders a orange disk with center (233, 193) and radius 62.
; PLAN: r0=233(x), r1=193(y), r2=62(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 233
LDI r1, 193
LDI r2, 62
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
