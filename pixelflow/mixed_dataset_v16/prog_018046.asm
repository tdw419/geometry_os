; DESCRIPTION: Renders a blue disk with center (353, 162) and radius 47.
; PLAN: r0=353(x), r1=162(y), r2=47(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 353
LDI r1, 162
LDI r2, 47
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
