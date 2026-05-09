; DESCRIPTION: Draws a purple line from (193, 246) to (316, 181).
; PLAN: r0=193(x1), r1=246(y1), r2=316(x2), r3=181(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 246
LDI r2, 316
LDI r3, 181
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
