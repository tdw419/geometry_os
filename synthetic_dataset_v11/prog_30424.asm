; DESCRIPTION: Draws a purple line from (233, 3) to (97, 248).
; PLAN: r0=233(x1), r1=3(y1), r2=97(x2), r3=248(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 3
LDI r2, 97
LDI r3, 248
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
