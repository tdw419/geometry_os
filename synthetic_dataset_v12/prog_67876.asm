; DESCRIPTION: Draws a magenta line from (116, 118) to (489, 255).
; PLAN: r0=116(x1), r1=118(y1), r2=489(x2), r3=255(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 118
LDI r2, 489
LDI r3, 255
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
