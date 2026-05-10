; DESCRIPTION: Draws a magenta line from (97, 40) to (336, 118).
; PLAN: r0=97(x1), r1=40(y1), r2=336(x2), r3=118(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 40
LDI r2, 336
LDI r3, 118
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
