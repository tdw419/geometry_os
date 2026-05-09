; DESCRIPTION: Places a blue circle of radius 56 at center (56, 145).
; PLAN: r0=56(x), r1=145(y), r2=56(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 56
LDI r1, 145
LDI r2, 56
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
