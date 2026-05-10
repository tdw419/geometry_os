; DESCRIPTION: Draws a purple line from (459, 246) to (425, 153).
; PLAN: r0=459(x1), r1=246(y1), r2=425(x2), r3=153(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 459
LDI r1, 246
LDI r2, 425
LDI r3, 153
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
