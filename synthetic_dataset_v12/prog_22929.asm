; DESCRIPTION: Draws a purple line from (36, 100) to (68, 148).
; PLAN: r0=36(x1), r1=100(y1), r2=68(x2), r3=148(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 100
LDI r2, 68
LDI r3, 148
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
