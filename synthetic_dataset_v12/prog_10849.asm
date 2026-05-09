; DESCRIPTION: Renders a purple disk with center (149, 115) and radius 72.
; PLAN: r0=149(x), r1=115(y), r2=72(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 149
LDI r1, 115
LDI r2, 72
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
