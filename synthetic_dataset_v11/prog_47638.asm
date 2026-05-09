; DESCRIPTION: Draws a purple line from (31, 229) to (68, 105).
; PLAN: r0=31(x1), r1=229(y1), r2=68(x2), r3=105(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 229
LDI r2, 68
LDI r3, 105
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
