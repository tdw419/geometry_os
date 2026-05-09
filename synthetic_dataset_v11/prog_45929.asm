; DESCRIPTION: Renders a purple disk with center (221, 24) and radius 17.
; PLAN: r0=221(x), r1=24(y), r2=17(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 221
LDI r1, 24
LDI r2, 17
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
