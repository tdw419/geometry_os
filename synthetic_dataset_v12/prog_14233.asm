; DESCRIPTION: Renders a purple disk with center (39, 172) and radius 24.
; PLAN: r0=39(x), r1=172(y), r2=24(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 39
LDI r1, 172
LDI r2, 24
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
