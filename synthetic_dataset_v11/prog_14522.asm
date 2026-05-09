; DESCRIPTION: Renders a green disk with center (158, 119) and radius 78.
; PLAN: r0=158(x), r1=119(y), r2=78(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 158
LDI r1, 119
LDI r2, 78
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
