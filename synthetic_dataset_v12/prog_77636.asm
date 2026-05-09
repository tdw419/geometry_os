; DESCRIPTION: Renders a purple disk with center (185, 133) and radius 17.
; PLAN: r0=185(x), r1=133(y), r2=17(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 185
LDI r1, 133
LDI r2, 17
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
