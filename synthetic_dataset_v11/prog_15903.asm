; DESCRIPTION: Draws a magenta line from (44, 150) to (133, 212).
; PLAN: r0=44(x1), r1=150(y1), r2=133(x2), r3=212(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 150
LDI r2, 133
LDI r3, 212
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
