; DESCRIPTION: Renders a blue disk with center (147, 141) and radius 23.
; PLAN: r0=147(x), r1=141(y), r2=23(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 147
LDI r1, 141
LDI r2, 23
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
