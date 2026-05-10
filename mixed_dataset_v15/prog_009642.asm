; DESCRIPTION: Places a blue circle of radius 51 at center (359, 148).
; PLAN: r0=359(x), r1=148(y), r2=51(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 359
LDI r1, 148
LDI r2, 51
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
