; DESCRIPTION: Renders a purple disk with center (459, 51) and radius 24.
; PLAN: r0=459(x), r1=51(y), r2=24(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 459
LDI r1, 51
LDI r2, 24
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
