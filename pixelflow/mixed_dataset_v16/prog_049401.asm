; DESCRIPTION: Draws a magenta line from (225, 123) to (451, 54).
; PLAN: r0=225(x1), r1=123(y1), r2=451(x2), r3=54(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 123
LDI r2, 451
LDI r3, 54
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
