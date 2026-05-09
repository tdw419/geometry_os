; DESCRIPTION: Renders a orange disk with center (148, 158) and radius 34.
; PLAN: r0=148(x), r1=158(y), r2=34(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 148
LDI r1, 158
LDI r2, 34
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
