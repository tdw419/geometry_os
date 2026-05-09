; DESCRIPTION: Renders a purple disk with center (117, 101) and radius 76.
; PLAN: r0=117(x), r1=101(y), r2=76(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 117
LDI r1, 101
LDI r2, 76
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
