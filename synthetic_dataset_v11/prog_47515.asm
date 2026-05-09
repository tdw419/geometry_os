; DESCRIPTION: Draws a purple line from (10, 115) to (161, 97).
; PLAN: r0=10(x1), r1=115(y1), r2=161(x2), r3=97(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 115
LDI r2, 161
LDI r3, 97
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
