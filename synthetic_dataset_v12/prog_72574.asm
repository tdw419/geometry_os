; DESCRIPTION: Draws a magenta line from (137, 181) to (73, 15).
; PLAN: r0=137(x1), r1=181(y1), r2=73(x2), r3=15(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 181
LDI r2, 73
LDI r3, 15
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
