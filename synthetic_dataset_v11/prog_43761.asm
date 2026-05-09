; DESCRIPTION: Renders a purple disk with center (89, 175) and radius 76.
; PLAN: r0=89(x), r1=175(y), r2=76(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 89
LDI r1, 175
LDI r2, 76
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
