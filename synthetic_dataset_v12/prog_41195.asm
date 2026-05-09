; DESCRIPTION: Draws a purple line from (217, 182) to (376, 106).
; PLAN: r0=217(x1), r1=182(y1), r2=376(x2), r3=106(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 182
LDI r2, 376
LDI r3, 106
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
