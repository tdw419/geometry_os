; DESCRIPTION: Draws a magenta line from (140, 56) to (158, 75).
; PLAN: r0=140(x1), r1=56(y1), r2=158(x2), r3=75(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 56
LDI r2, 158
LDI r3, 75
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
