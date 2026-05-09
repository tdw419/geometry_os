; DESCRIPTION: Draws a purple line from (238, 81) to (414, 162).
; PLAN: r0=238(x1), r1=81(y1), r2=414(x2), r3=162(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 81
LDI r2, 414
LDI r3, 162
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
