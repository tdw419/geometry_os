; DESCRIPTION: Draws a purple line from (137, 81) to (53, 202).
; PLAN: r0=137(x1), r1=81(y1), r2=53(x2), r3=202(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 81
LDI r2, 53
LDI r3, 202
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
