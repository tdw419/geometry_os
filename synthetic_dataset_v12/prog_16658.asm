; DESCRIPTION: Draws a purple line from (201, 128) to (428, 38).
; PLAN: r0=201(x1), r1=128(y1), r2=428(x2), r3=38(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 128
LDI r2, 428
LDI r3, 38
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
