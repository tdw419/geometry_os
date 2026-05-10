; DESCRIPTION: Draws a purple line from (407, 34) to (35, 233).
; PLAN: r0=407(x1), r1=34(y1), r2=35(x2), r3=233(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 407
LDI r1, 34
LDI r2, 35
LDI r3, 233
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
