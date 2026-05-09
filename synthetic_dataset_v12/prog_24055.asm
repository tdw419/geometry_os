; DESCRIPTION: Draws a purple line from (81, 132) to (390, 187).
; PLAN: r0=81(x1), r1=132(y1), r2=390(x2), r3=187(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 132
LDI r2, 390
LDI r3, 187
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
