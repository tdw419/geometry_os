; DESCRIPTION: Renders a blue disk with center (133, 135) and radius 55.
; PLAN: r0=133(x), r1=135(y), r2=55(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 133
LDI r1, 135
LDI r2, 55
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
