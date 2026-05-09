; DESCRIPTION: Draws a purple line from (390, 227) to (54, 187).
; PLAN: r0=390(x1), r1=227(y1), r2=54(x2), r3=187(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 390
LDI r1, 227
LDI r2, 54
LDI r3, 187
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
