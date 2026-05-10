; DESCRIPTION: Renders a purple disk with center (243, 84) and radius 51.
; PLAN: r0=243(x), r1=84(y), r2=51(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 243
LDI r1, 84
LDI r2, 51
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
