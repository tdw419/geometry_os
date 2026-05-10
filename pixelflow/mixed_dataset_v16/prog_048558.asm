; DESCRIPTION: Renders a purple disk with center (28, 121) and radius 26.
; PLAN: r0=28(x), r1=121(y), r2=26(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 28
LDI r1, 121
LDI r2, 26
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
