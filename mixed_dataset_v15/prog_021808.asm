; DESCRIPTION: Renders a purple disk with center (251, 181) and radius 40.
; PLAN: r0=251(x), r1=181(y), r2=40(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 251
LDI r1, 181
LDI r2, 40
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
