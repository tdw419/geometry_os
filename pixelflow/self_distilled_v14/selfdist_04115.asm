; DESCRIPTION: Draws a purple line from (318, 179) to (187, 35).
; PLAN: r0=318(x1), r1=179(y1), r2=187(x2), r3=35(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 179
LDI r2, 187
LDI r3, 35
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
