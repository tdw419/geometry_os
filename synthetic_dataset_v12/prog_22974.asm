; DESCRIPTION: Draws a magenta line from (314, 49) to (113, 34).
; PLAN: r0=314(x1), r1=49(y1), r2=113(x2), r3=34(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 314
LDI r1, 49
LDI r2, 113
LDI r3, 34
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
