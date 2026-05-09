; DESCRIPTION: Renders a blue disk with center (269, 136) and radius 59.
; PLAN: r0=269(x), r1=136(y), r2=59(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 269
LDI r1, 136
LDI r2, 59
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
