; DESCRIPTION: Renders a purple disk with center (368, 122) and radius 79.
; PLAN: r0=368(x), r1=122(y), r2=79(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 368
LDI r1, 122
LDI r2, 79
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
