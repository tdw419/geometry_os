; DESCRIPTION: Draws a purple line from (212, 119) to (180, 23).
; PLAN: r0=212(x1), r1=119(y1), r2=180(x2), r3=23(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 119
LDI r2, 180
LDI r3, 23
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
