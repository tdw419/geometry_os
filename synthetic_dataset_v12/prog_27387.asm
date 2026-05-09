; DESCRIPTION: Places a blue circle of radius 75 at center (388, 145).
; PLAN: r0=388(x), r1=145(y), r2=75(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 388
LDI r1, 145
LDI r2, 75
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
