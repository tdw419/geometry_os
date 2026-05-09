; DESCRIPTION: Draws a magenta line from (457, 158) to (15, 127).
; PLAN: r0=457(x1), r1=158(y1), r2=15(x2), r3=127(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 457
LDI r1, 158
LDI r2, 15
LDI r3, 127
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
