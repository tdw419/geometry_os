; DESCRIPTION: Renders a black disk with center (84, 144) and radius 35.
; PLAN: r0=84(x), r1=144(y), r2=35(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 84
LDI r1, 144
LDI r2, 35
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
