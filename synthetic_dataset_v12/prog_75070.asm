; DESCRIPTION: Renders a green disk with center (44, 139) and radius 22.
; PLAN: r0=44(x), r1=139(y), r2=22(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 44
LDI r1, 139
LDI r2, 22
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
