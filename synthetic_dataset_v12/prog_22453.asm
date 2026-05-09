; DESCRIPTION: Renders a blue disk with center (350, 185) and radius 71.
; PLAN: r0=350(x), r1=185(y), r2=71(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 350
LDI r1, 185
LDI r2, 71
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
