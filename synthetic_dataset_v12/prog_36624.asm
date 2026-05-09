; DESCRIPTION: Renders a blue disk with center (427, 171) and radius 74.
; PLAN: r0=427(x), r1=171(y), r2=74(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 427
LDI r1, 171
LDI r2, 74
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
