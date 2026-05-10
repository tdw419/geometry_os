; DESCRIPTION: Draws a purple line from (316, 182) to (186, 252).
; PLAN: r0=316(x1), r1=182(y1), r2=186(x2), r3=252(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 182
LDI r2, 186
LDI r3, 252
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
