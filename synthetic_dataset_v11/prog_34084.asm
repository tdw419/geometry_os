; DESCRIPTION: Renders a orange disk with center (93, 176) and radius 65.
; PLAN: r0=93(x), r1=176(y), r2=65(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 93
LDI r1, 176
LDI r2, 65
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
