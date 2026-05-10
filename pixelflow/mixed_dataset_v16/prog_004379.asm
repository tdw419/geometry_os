; DESCRIPTION: Draws a magenta line from (301, 54) to (472, 156).
; PLAN: r0=301(x1), r1=54(y1), r2=472(x2), r3=156(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 301
LDI r1, 54
LDI r2, 472
LDI r3, 156
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
