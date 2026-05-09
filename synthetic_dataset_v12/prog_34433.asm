; DESCRIPTION: Renders a purple disk with center (131, 109) and radius 36.
; PLAN: r0=131(x), r1=109(y), r2=36(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 131
LDI r1, 109
LDI r2, 36
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
