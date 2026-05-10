; DESCRIPTION: Draws a purple line from (315, 119) to (406, 218).
; PLAN: r0=315(x1), r1=119(y1), r2=406(x2), r3=218(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 119
LDI r2, 406
LDI r3, 218
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
