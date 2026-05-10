; DESCRIPTION: Draws a magenta line from (102, 229) to (314, 43).
; PLAN: r0=102(x1), r1=229(y1), r2=314(x2), r3=43(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 229
LDI r2, 314
LDI r3, 43
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
