; DESCRIPTION: Renders a blue disk with center (314, 135) and radius 53.
; PLAN: r0=314(x), r1=135(y), r2=53(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 314
LDI r1, 135
LDI r2, 53
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
