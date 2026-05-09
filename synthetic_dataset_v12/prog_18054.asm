; DESCRIPTION: Renders a green disk with center (158, 162) and radius 46.
; PLAN: r0=158(x), r1=162(y), r2=46(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 158
LDI r1, 162
LDI r2, 46
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
