; DESCRIPTION: Renders a purple disk with center (171, 136) and radius 70.
; PLAN: r0=171(x), r1=136(y), r2=70(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 171
LDI r1, 136
LDI r2, 70
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
