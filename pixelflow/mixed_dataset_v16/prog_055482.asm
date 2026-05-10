; DESCRIPTION: Draws a purple line from (268, 132) to (326, 118).
; PLAN: r0=268(x1), r1=132(y1), r2=326(x2), r3=118(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 132
LDI r2, 326
LDI r3, 118
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
