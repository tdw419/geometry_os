; DESCRIPTION: Draws a purple line from (148, 145) to (162, 190).
; PLAN: r0=148(x1), r1=145(y1), r2=162(x2), r3=190(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 145
LDI r2, 162
LDI r3, 190
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
