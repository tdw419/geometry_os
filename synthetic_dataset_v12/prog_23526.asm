; DESCRIPTION: Draws a magenta line from (451, 174) to (155, 34).
; PLAN: r0=451(x1), r1=174(y1), r2=155(x2), r3=34(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 451
LDI r1, 174
LDI r2, 155
LDI r3, 34
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
