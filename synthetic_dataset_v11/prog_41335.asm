; DESCRIPTION: Draws a purple line from (181, 135) to (246, 114).
; PLAN: r0=181(x1), r1=135(y1), r2=246(x2), r3=114(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 135
LDI r2, 246
LDI r3, 114
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
