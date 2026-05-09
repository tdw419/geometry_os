; DESCRIPTION: Renders a blue disk with center (137, 149) and radius 75.
; PLAN: r0=137(x), r1=149(y), r2=75(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 137
LDI r1, 149
LDI r2, 75
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
