; DESCRIPTION: Renders a blue disk with center (134, 169) and radius 48.
; PLAN: r0=134(x), r1=169(y), r2=48(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 134
LDI r1, 169
LDI r2, 48
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
