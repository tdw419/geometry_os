; DESCRIPTION: Renders a purple disk with center (145, 60) and radius 57.
; PLAN: r0=145(x), r1=60(y), r2=57(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 145
LDI r1, 60
LDI r2, 57
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
