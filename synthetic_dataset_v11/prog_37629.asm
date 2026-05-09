; DESCRIPTION: Draws a magenta line from (133, 123) to (158, 31).
; PLAN: r0=133(x1), r1=123(y1), r2=158(x2), r3=31(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 123
LDI r2, 158
LDI r3, 31
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
