; DESCRIPTION: Draws a purple line from (248, 10) to (93, 21).
; PLAN: r0=248(x1), r1=10(y1), r2=93(x2), r3=21(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 10
LDI r2, 93
LDI r3, 21
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
