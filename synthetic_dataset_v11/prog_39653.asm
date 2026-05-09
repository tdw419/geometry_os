; DESCRIPTION: Renders a purple disk with center (158, 107) and radius 64.
; PLAN: r0=158(x), r1=107(y), r2=64(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 158
LDI r1, 107
LDI r2, 64
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
