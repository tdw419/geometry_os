; DESCRIPTION: Renders a blue disk with center (240, 73) and radius 69.
; PLAN: r0=240(x), r1=73(y), r2=69(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 240
LDI r1, 73
LDI r2, 69
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
