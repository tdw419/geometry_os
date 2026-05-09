; DESCRIPTION: Draws a purple line from (408, 143) to (297, 185).
; PLAN: r0=408(x1), r1=143(y1), r2=297(x2), r3=185(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 408
LDI r1, 143
LDI r2, 297
LDI r3, 185
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
