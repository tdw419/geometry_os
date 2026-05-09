; DESCRIPTION: Draws a purple line from (273, 39) to (36, 78).
; PLAN: r0=273(x1), r1=39(y1), r2=36(x2), r3=78(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 39
LDI r2, 36
LDI r3, 78
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
