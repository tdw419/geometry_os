; DESCRIPTION: Renders a blue disk with center (411, 116) and radius 33.
; PLAN: r0=411(x), r1=116(y), r2=33(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 411
LDI r1, 116
LDI r2, 33
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
