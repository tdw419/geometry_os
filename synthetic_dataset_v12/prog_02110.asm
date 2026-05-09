; DESCRIPTION: Renders a blue disk with center (408, 139) and radius 22.
; PLAN: r0=408(x), r1=139(y), r2=22(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 408
LDI r1, 139
LDI r2, 22
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
