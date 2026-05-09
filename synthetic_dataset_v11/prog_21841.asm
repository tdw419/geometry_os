; DESCRIPTION: Renders a purple disk with center (96, 89) and radius 58.
; PLAN: r0=96(x), r1=89(y), r2=58(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 96
LDI r1, 89
LDI r2, 58
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
