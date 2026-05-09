; DESCRIPTION: Renders a blue disk with center (153, 199) and radius 55.
; PLAN: r0=153(x), r1=199(y), r2=55(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 153
LDI r1, 199
LDI r2, 55
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
