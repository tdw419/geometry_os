; DESCRIPTION: Draws a purple line from (68, 72) to (208, 153).
; PLAN: r0=68(x1), r1=72(y1), r2=208(x2), r3=153(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 72
LDI r2, 208
LDI r3, 153
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
