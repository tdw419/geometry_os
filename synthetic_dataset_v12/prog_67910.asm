; DESCRIPTION: Draws a red line from (489, 102) to (236, 94).
; PLAN: r0=489(x1), r1=102(y1), r2=236(x2), r3=94(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 489
LDI r1, 102
LDI r2, 236
LDI r3, 94
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
