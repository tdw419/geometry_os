; DESCRIPTION: Draws a purple line from (423, 250) to (212, 127).
; PLAN: r0=423(x1), r1=250(y1), r2=212(x2), r3=127(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 423
LDI r1, 250
LDI r2, 212
LDI r3, 127
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
