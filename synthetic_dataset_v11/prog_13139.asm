; DESCRIPTION: Draws a purple line from (117, 118) to (185, 189).
; PLAN: r0=117(x1), r1=118(y1), r2=185(x2), r3=189(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 118
LDI r2, 185
LDI r3, 189
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
