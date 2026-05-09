; DESCRIPTION: Draws a purple line from (287, 59) to (145, 105).
; PLAN: r0=287(x1), r1=59(y1), r2=145(x2), r3=105(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 59
LDI r2, 145
LDI r3, 105
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
