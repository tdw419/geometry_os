; DESCRIPTION: Places a blue line segment connecting (422, 139) to (56, 108).
; PLAN: r0=422(x1), r1=139(y1), r2=56(x2), r3=108(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 422
LDI r1, 139
LDI r2, 56
LDI r3, 108
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
