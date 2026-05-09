; DESCRIPTION: Draws a purple line from (31, 190) to (240, 159).
; PLAN: r0=31(x1), r1=190(y1), r2=240(x2), r3=159(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 190
LDI r2, 240
LDI r3, 159
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
