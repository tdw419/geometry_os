; DESCRIPTION: Places a blue circle of radius 21 at center (389, 70).
; PLAN: r0=389(x), r1=70(y), r2=21(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 389
LDI r1, 70
LDI r2, 21
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
