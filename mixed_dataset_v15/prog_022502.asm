; DESCRIPTION: Draws a magenta line from (364, 179) to (489, 79).
; PLAN: r0=364(x1), r1=179(y1), r2=489(x2), r3=79(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 364
LDI r1, 179
LDI r2, 489
LDI r3, 79
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
