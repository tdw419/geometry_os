; DESCRIPTION: Renders a blue disk with center (105, 159) and radius 11.
; PLAN: r0=105(x), r1=159(y), r2=11(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 105
LDI r1, 159
LDI r2, 11
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
