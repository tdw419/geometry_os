; DESCRIPTION: Draws a purple line from (133, 30) to (161, 226).
; PLAN: r0=133(x1), r1=30(y1), r2=161(x2), r3=226(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 30
LDI r2, 161
LDI r3, 226
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
