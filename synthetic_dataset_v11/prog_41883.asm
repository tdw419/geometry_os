; DESCRIPTION: Renders a blue disk with center (164, 101) and radius 35.
; PLAN: r0=164(x), r1=101(y), r2=35(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 164
LDI r1, 101
LDI r2, 35
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
