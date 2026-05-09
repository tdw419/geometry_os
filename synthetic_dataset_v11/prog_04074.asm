; DESCRIPTION: Draws a purple line from (10, 153) to (29, 252).
; PLAN: r0=10(x1), r1=153(y1), r2=29(x2), r3=252(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 153
LDI r2, 29
LDI r3, 252
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
