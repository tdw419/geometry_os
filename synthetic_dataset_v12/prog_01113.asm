; DESCRIPTION: Draws a purple line from (5, 227) to (175, 34).
; PLAN: r0=5(x1), r1=227(y1), r2=175(x2), r3=34(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 227
LDI r2, 175
LDI r3, 34
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
