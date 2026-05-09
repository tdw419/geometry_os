; DESCRIPTION: Renders a blue disk with center (51, 106) and radius 40.
; PLAN: r0=51(x), r1=106(y), r2=40(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 51
LDI r1, 106
LDI r2, 40
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
