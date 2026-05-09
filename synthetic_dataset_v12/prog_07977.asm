; DESCRIPTION: Draws a purple line from (297, 7) to (132, 86).
; PLAN: r0=297(x1), r1=7(y1), r2=132(x2), r3=86(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 297
LDI r1, 7
LDI r2, 132
LDI r3, 86
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
