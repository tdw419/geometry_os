; DESCRIPTION: Renders a blue circular shape at (159, 6) with radius 79.
; PLAN: r0=159(x), r1=6(y), r2=79(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 159
LDI r1, 6
LDI r2, 79
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
