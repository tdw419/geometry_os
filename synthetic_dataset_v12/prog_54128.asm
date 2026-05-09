; DESCRIPTION: Renders a purple disk with center (316, 141) and radius 64.
; PLAN: r0=316(x), r1=141(y), r2=64(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 316
LDI r1, 141
LDI r2, 64
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
