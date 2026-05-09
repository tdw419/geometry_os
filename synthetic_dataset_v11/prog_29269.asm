; DESCRIPTION: Draws a magenta line from (54, 165) to (100, 147).
; PLAN: r0=54(x1), r1=165(y1), r2=100(x2), r3=147(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 165
LDI r2, 100
LDI r3, 147
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
