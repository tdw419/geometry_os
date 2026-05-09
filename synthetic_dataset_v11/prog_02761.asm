; DESCRIPTION: Renders a purple disk with center (147, 92) and radius 19.
; PLAN: r0=147(x), r1=92(y), r2=19(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 147
LDI r1, 92
LDI r2, 19
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
