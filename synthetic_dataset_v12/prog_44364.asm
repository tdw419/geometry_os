; DESCRIPTION: Renders a red disk with center (134, 158) and radius 80.
; PLAN: r0=134(x), r1=158(y), r2=80(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 134
LDI r1, 158
LDI r2, 80
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
