; DESCRIPTION: Draws a magenta line from (85, 155) to (80, 25).
; PLAN: r0=85(x1), r1=155(y1), r2=80(x2), r3=25(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 155
LDI r2, 80
LDI r3, 25
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
