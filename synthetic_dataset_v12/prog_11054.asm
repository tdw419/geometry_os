; DESCRIPTION: Renders a yellow disk with center (255, 158) and radius 22.
; PLAN: r0=255(x), r1=158(y), r2=22(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 255
LDI r1, 158
LDI r2, 22
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
