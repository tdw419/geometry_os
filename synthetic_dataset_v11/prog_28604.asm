; DESCRIPTION: Draws a purple line from (246, 6) to (19, 98).
; PLAN: r0=246(x1), r1=6(y1), r2=19(x2), r3=98(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 6
LDI r2, 19
LDI r3, 98
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
