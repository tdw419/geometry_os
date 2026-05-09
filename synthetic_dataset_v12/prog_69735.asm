; DESCRIPTION: Renders a purple disk with center (134, 55) and radius 11.
; PLAN: r0=134(x), r1=55(y), r2=11(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 134
LDI r1, 55
LDI r2, 11
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
