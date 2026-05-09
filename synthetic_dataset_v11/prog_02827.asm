; DESCRIPTION: Draws a magenta line from (229, 75) to (158, 176).
; PLAN: r0=229(x1), r1=75(y1), r2=158(x2), r3=176(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 75
LDI r2, 158
LDI r3, 176
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
