; DESCRIPTION: Renders a purple disk with center (325, 164) and radius 29.
; PLAN: r0=325(x), r1=164(y), r2=29(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 325
LDI r1, 164
LDI r2, 29
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
