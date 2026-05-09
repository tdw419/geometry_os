; DESCRIPTION: Renders a blue disk with center (84, 225) and radius 21.
; PLAN: r0=84(x), r1=225(y), r2=21(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 84
LDI r1, 225
LDI r2, 21
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
