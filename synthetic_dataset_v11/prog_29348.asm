; DESCRIPTION: Renders a purple disk with center (35, 76) and radius 28.
; PLAN: r0=35(x), r1=76(y), r2=28(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 35
LDI r1, 76
LDI r2, 28
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
