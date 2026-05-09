; DESCRIPTION: Draws a magenta line from (80, 81) to (155, 92).
; PLAN: r0=80(x1), r1=81(y1), r2=155(x2), r3=92(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 81
LDI r2, 155
LDI r3, 92
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
