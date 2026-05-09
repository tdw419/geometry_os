; DESCRIPTION: Renders a purple disk with center (389, 138) and radius 44.
; PLAN: r0=389(x), r1=138(y), r2=44(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 389
LDI r1, 138
LDI r2, 44
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
