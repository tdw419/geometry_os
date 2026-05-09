; DESCRIPTION: Draws a magenta line from (232, 181) to (251, 54).
; PLAN: r0=232(x1), r1=181(y1), r2=251(x2), r3=54(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 181
LDI r2, 251
LDI r3, 54
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
