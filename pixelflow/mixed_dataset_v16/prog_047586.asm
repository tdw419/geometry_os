; DESCRIPTION: Renders a blue disk with center (219, 167) and radius 70.
; PLAN: r0=219(x), r1=167(y), r2=70(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 219
LDI r1, 167
LDI r2, 70
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
