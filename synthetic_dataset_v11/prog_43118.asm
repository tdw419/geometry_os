; DESCRIPTION: Draws a purple line from (133, 182) to (52, 156).
; PLAN: r0=133(x1), r1=182(y1), r2=52(x2), r3=156(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 182
LDI r2, 52
LDI r3, 156
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
