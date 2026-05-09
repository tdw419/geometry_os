; DESCRIPTION: Places a blue line segment connecting (390, 200) to (305, 168).
; PLAN: r0=390(x1), r1=200(y1), r2=305(x2), r3=168(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 390
LDI r1, 200
LDI r2, 305
LDI r3, 168
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
