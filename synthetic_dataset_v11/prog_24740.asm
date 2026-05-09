; DESCRIPTION: Renders a purple disk with center (176, 101) and radius 80.
; PLAN: r0=176(x), r1=101(y), r2=80(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 176
LDI r1, 101
LDI r2, 80
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
