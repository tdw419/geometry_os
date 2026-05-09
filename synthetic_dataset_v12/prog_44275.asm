; DESCRIPTION: Renders a purple disk with center (359, 81) and radius 28.
; PLAN: r0=359(x), r1=81(y), r2=28(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 359
LDI r1, 81
LDI r2, 28
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
