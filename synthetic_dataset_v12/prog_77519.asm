; DESCRIPTION: Places a blue circle of radius 75 at center (200, 122).
; PLAN: r0=200(x), r1=122(y), r2=75(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 200
LDI r1, 122
LDI r2, 75
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
