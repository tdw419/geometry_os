; DESCRIPTION: Renders a purple disk with center (65, 140) and radius 47.
; PLAN: r0=65(x), r1=140(y), r2=47(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 65
LDI r1, 140
LDI r2, 47
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
