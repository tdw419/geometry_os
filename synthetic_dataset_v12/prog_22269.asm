; DESCRIPTION: Renders a purple disk with center (427, 106) and radius 72.
; PLAN: r0=427(x), r1=106(y), r2=72(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 427
LDI r1, 106
LDI r2, 72
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
