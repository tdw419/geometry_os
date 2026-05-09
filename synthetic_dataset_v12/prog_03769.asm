; DESCRIPTION: Renders a purple disk with center (418, 106) and radius 60.
; PLAN: r0=418(x), r1=106(y), r2=60(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 418
LDI r1, 106
LDI r2, 60
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
