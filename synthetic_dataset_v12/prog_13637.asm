; DESCRIPTION: Renders a purple disk with center (438, 81) and radius 29.
; PLAN: r0=438(x), r1=81(y), r2=29(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 438
LDI r1, 81
LDI r2, 29
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
