; DESCRIPTION: Renders a yellow disk with center (158, 179) and radius 47.
; PLAN: r0=158(x), r1=179(y), r2=47(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 158
LDI r1, 179
LDI r2, 47
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
