; DESCRIPTION: Renders a purple disk with center (375, 167) and radius 79.
; PLAN: r0=375(x), r1=167(y), r2=79(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 375
LDI r1, 167
LDI r2, 79
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
