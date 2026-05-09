; DESCRIPTION: Places a blue circle of radius 20 at center (53, 185).
; PLAN: r0=53(x), r1=185(y), r2=20(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 53
LDI r1, 185
LDI r2, 20
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
