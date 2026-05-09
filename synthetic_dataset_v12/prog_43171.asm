; DESCRIPTION: Draws a purple line from (157, 145) to (34, 36).
; PLAN: r0=157(x1), r1=145(y1), r2=34(x2), r3=36(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 145
LDI r2, 34
LDI r3, 36
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
