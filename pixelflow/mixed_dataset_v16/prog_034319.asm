; DESCRIPTION: Draws a magenta line from (377, 158) to (133, 254).
; PLAN: r0=377(x1), r1=158(y1), r2=133(x2), r3=254(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 377
LDI r1, 158
LDI r2, 133
LDI r3, 254
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
