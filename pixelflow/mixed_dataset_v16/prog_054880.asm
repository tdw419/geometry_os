; DESCRIPTION: Draws a purple line from (114, 68) to (155, 162).
; PLAN: r0=114(x1), r1=68(y1), r2=155(x2), r3=162(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 68
LDI r2, 155
LDI r3, 162
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
