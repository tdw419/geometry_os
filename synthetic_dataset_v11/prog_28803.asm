; DESCRIPTION: Draws a magenta line from (133, 22) to (84, 169).
; PLAN: r0=133(x1), r1=22(y1), r2=84(x2), r3=169(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 22
LDI r2, 84
LDI r3, 169
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
