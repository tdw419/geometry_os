; DESCRIPTION: Places a purple line segment connecting (403, 212) to (135, 47).
; PLAN: r0=403(x1), r1=212(y1), r2=135(x2), r3=47(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 212
LDI r2, 135
LDI r3, 47
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
