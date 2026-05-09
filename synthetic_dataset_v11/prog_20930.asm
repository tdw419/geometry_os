; DESCRIPTION: Renders a purple disk with center (104, 81) and radius 61.
; PLAN: r0=104(x), r1=81(y), r2=61(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 104
LDI r1, 81
LDI r2, 61
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
