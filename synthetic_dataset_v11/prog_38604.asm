; DESCRIPTION: Draws a magenta line from (111, 218) to (10, 212).
; PLAN: r0=111(x1), r1=218(y1), r2=10(x2), r3=212(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 218
LDI r2, 10
LDI r3, 212
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
