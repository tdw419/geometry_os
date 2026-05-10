; DESCRIPTION: Draws a purple line from (272, 189) to (212, 118).
; PLAN: r0=272(x1), r1=189(y1), r2=212(x2), r3=118(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 189
LDI r2, 212
LDI r3, 118
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
