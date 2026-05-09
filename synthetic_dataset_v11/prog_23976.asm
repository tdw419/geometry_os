; DESCRIPTION: Renders a purple disk with center (192, 105) and radius 51.
; PLAN: r0=192(x), r1=105(y), r2=51(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 192
LDI r1, 105
LDI r2, 51
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
