; DESCRIPTION: Draws a purple line from (229, 119) to (13, 93).
; PLAN: r0=229(x1), r1=119(y1), r2=13(x2), r3=93(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 119
LDI r2, 13
LDI r3, 93
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
