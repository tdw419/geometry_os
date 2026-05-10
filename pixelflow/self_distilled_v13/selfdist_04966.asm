; DESCRIPTION: Draws a purple line from (49, 89) to (121, 199).
; PLAN: r0=49(x1), r1=89(y1), r2=121(x2), r3=199(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 89
LDI r2, 121
LDI r3, 199
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
