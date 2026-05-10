; DESCRIPTION: Places a purple line segment connecting (305, 216) to (503, 135).
; PLAN: r0=305(x1), r1=216(y1), r2=503(x2), r3=135(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 216
LDI r2, 503
LDI r3, 135
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
