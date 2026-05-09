; DESCRIPTION: Renders a purple disk with center (420, 86) and radius 73.
; PLAN: r0=420(x), r1=86(y), r2=73(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 420
LDI r1, 86
LDI r2, 73
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
