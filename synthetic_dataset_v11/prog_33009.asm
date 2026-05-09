; DESCRIPTION: Renders a blue disk with center (222, 94) and radius 12.
; PLAN: r0=222(x), r1=94(y), r2=12(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 222
LDI r1, 94
LDI r2, 12
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
