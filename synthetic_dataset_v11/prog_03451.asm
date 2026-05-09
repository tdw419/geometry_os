; DESCRIPTION: Draws a purple line from (201, 133) to (104, 161).
; PLAN: r0=201(x1), r1=133(y1), r2=104(x2), r3=161(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 133
LDI r2, 104
LDI r3, 161
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
