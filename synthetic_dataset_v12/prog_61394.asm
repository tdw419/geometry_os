; DESCRIPTION: Renders a blue disk with center (450, 136) and radius 50.
; PLAN: r0=450(x), r1=136(y), r2=50(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 450
LDI r1, 136
LDI r2, 50
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
