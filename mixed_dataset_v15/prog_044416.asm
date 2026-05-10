; DESCRIPTION: Renders a red disk with center (227, 158) and radius 30.
; PLAN: r0=227(x), r1=158(y), r2=30(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 227
LDI r1, 158
LDI r2, 30
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
