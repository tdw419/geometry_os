; DESCRIPTION: Draws a purple line from (324, 3) to (355, 106).
; PLAN: r0=324(x1), r1=3(y1), r2=355(x2), r3=106(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 3
LDI r2, 355
LDI r3, 106
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
