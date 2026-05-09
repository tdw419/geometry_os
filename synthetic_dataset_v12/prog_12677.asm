; DESCRIPTION: Draws a purple line from (26, 180) to (133, 11).
; PLAN: r0=26(x1), r1=180(y1), r2=133(x2), r3=11(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 180
LDI r2, 133
LDI r3, 11
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
