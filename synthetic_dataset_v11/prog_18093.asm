; DESCRIPTION: Renders a purple disk with center (95, 238) and radius 13.
; PLAN: r0=95(x), r1=238(y), r2=13(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 95
LDI r1, 238
LDI r2, 13
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
