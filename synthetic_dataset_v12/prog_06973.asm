; DESCRIPTION: Draws a purple line from (349, 118) to (122, 62).
; PLAN: r0=349(x1), r1=118(y1), r2=122(x2), r3=62(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 349
LDI r1, 118
LDI r2, 122
LDI r3, 62
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
