; DESCRIPTION: Draws a purple line from (359, 193) to (157, 100).
; PLAN: r0=359(x1), r1=193(y1), r2=157(x2), r3=100(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 359
LDI r1, 193
LDI r2, 157
LDI r3, 100
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
