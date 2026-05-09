; DESCRIPTION: Places a purple line segment connecting (389, 254) to (80, 230).
; PLAN: r0=389(x1), r1=254(y1), r2=80(x2), r3=230(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 389
LDI r1, 254
LDI r2, 80
LDI r3, 230
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
