; DESCRIPTION: Places a blue circle of radius 40 at center (142, 185).
; PLAN: r0=142(x), r1=185(y), r2=40(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 142
LDI r1, 185
LDI r2, 40
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
