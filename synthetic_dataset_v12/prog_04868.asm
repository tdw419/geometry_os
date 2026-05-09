; DESCRIPTION: Renders a blue disk with center (377, 178) and radius 35.
; PLAN: r0=377(x), r1=178(y), r2=35(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 377
LDI r1, 178
LDI r2, 35
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
