; DESCRIPTION: Draws a magenta line from (54, 3) to (315, 212).
; PLAN: r0=54(x1), r1=3(y1), r2=315(x2), r3=212(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 3
LDI r2, 315
LDI r3, 212
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
