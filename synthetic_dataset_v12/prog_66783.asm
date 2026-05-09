; DESCRIPTION: Renders a purple disk with center (181, 118) and radius 79.
; PLAN: r0=181(x), r1=118(y), r2=79(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 181
LDI r1, 118
LDI r2, 79
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
