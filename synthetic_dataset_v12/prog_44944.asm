; DESCRIPTION: Draws a yellow line from (489, 34) to (424, 79).
; PLAN: r0=489(x1), r1=34(y1), r2=424(x2), r3=79(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 489
LDI r1, 34
LDI r2, 424
LDI r3, 79
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
