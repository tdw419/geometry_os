; DESCRIPTION: Renders a blue disk with center (90, 147) and radius 50.
; PLAN: r0=90(x), r1=147(y), r2=50(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 90
LDI r1, 147
LDI r2, 50
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
