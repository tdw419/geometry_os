; DESCRIPTION: Draws a purple line from (211, 246) to (132, 170).
; PLAN: r0=211(x1), r1=246(y1), r2=132(x2), r3=170(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 246
LDI r2, 132
LDI r3, 170
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
