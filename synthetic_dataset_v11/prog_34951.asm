; DESCRIPTION: Renders a blue disk with center (26, 118) and radius 17.
; PLAN: r0=26(x), r1=118(y), r2=17(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 26
LDI r1, 118
LDI r2, 17
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
