; DESCRIPTION: Draws a magenta line from (314, 88) to (381, 248).
; PLAN: r0=314(x1), r1=88(y1), r2=381(x2), r3=248(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 314
LDI r1, 88
LDI r2, 381
LDI r3, 248
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
