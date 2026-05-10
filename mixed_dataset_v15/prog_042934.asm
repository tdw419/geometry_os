; DESCRIPTION: Draws a purple line from (471, 94) to (183, 102).
; PLAN: r0=471(x1), r1=94(y1), r2=183(x2), r3=102(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 471
LDI r1, 94
LDI r2, 183
LDI r3, 102
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
