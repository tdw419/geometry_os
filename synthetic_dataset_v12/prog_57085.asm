; DESCRIPTION: Draws a magenta line from (439, 118) to (43, 100).
; PLAN: r0=439(x1), r1=118(y1), r2=43(x2), r3=100(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 439
LDI r1, 118
LDI r2, 43
LDI r3, 100
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
