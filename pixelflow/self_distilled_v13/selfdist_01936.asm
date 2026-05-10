; DESCRIPTION: Draws a magenta line from (381, 158) to (15, 188).
; PLAN: r0=381(x1), r1=158(y1), r2=15(x2), r3=188(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 158
LDI r2, 15
LDI r3, 188
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
