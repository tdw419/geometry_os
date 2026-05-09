; DESCRIPTION: Renders a blue disk with center (366, 184) and radius 35.
; PLAN: r0=366(x), r1=184(y), r2=35(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 366
LDI r1, 184
LDI r2, 35
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
