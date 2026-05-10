; DESCRIPTION: Renders a blue disk with center (235, 66) and radius 51.
; PLAN: r0=235(x), r1=66(y), r2=51(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 235
LDI r1, 66
LDI r2, 51
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
