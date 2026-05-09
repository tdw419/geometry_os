; DESCRIPTION: Draws a purple line from (157, 134) to (145, 137).
; PLAN: r0=157(x1), r1=134(y1), r2=145(x2), r3=137(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 134
LDI r2, 145
LDI r3, 137
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
