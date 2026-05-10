; DESCRIPTION: Draws a magenta line from (33, 158) to (489, 152).
; PLAN: r0=33(x1), r1=158(y1), r2=489(x2), r3=152(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 158
LDI r2, 489
LDI r3, 152
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
