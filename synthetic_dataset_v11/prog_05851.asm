; DESCRIPTION: Renders a blue disk with center (177, 158) and radius 79.
; PLAN: r0=177(x), r1=158(y), r2=79(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 177
LDI r1, 158
LDI r2, 79
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
