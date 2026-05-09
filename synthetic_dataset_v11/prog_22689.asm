; DESCRIPTION: Draws a purple line from (169, 187) to (81, 179).
; PLAN: r0=169(x1), r1=187(y1), r2=81(x2), r3=179(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 187
LDI r2, 81
LDI r3, 179
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
