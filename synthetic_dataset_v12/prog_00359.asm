; DESCRIPTION: Renders a orange disk with center (179, 169) and radius 47.
; PLAN: r0=179(x), r1=169(y), r2=47(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 179
LDI r1, 169
LDI r2, 47
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
