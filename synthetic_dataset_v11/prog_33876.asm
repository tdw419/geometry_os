; DESCRIPTION: Renders a black disk with center (137, 84) and radius 70.
; PLAN: r0=137(x), r1=84(y), r2=70(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 137
LDI r1, 84
LDI r2, 70
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
