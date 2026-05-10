; DESCRIPTION: Places a blue line segment connecting (409, 190) to (419, 70).
; PLAN: r0=409(x1), r1=190(y1), r2=419(x2), r3=70(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 409
LDI r1, 190
LDI r2, 419
LDI r3, 70
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
