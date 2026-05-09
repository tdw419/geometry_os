; DESCRIPTION: Renders a purple disk with center (416, 136) and radius 22.
; PLAN: r0=416(x), r1=136(y), r2=22(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 416
LDI r1, 136
LDI r2, 22
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
