; DESCRIPTION: Renders a blue disk with center (395, 84) and radius 53.
; PLAN: r0=395(x), r1=84(y), r2=53(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 395
LDI r1, 84
LDI r2, 53
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
