; DESCRIPTION: Renders a blue disk with center (136, 138) and radius 71.
; PLAN: r0=136(x), r1=138(y), r2=71(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 136
LDI r1, 138
LDI r2, 71
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
