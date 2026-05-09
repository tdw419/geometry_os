; DESCRIPTION: Draws a purple line from (390, 60) to (176, 10).
; PLAN: r0=390(x1), r1=60(y1), r2=176(x2), r3=10(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 390
LDI r1, 60
LDI r2, 176
LDI r3, 10
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
