; DESCRIPTION: Draws a purple line from (408, 35) to (489, 156).
; PLAN: r0=408(x1), r1=35(y1), r2=489(x2), r3=156(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 408
LDI r1, 35
LDI r2, 489
LDI r3, 156
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
