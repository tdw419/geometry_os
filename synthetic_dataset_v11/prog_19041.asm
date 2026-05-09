; DESCRIPTION: Renders a blue disk with center (144, 106) and radius 69.
; PLAN: r0=144(x), r1=106(y), r2=69(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 144
LDI r1, 106
LDI r2, 69
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
