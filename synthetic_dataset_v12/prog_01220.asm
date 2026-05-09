; DESCRIPTION: Draws a purple line from (90, 34) to (266, 10).
; PLAN: r0=90(x1), r1=34(y1), r2=266(x2), r3=10(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 34
LDI r2, 266
LDI r3, 10
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
