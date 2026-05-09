; DESCRIPTION: Draws a magenta line from (54, 252) to (393, 84).
; PLAN: r0=54(x1), r1=252(y1), r2=393(x2), r3=84(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 252
LDI r2, 393
LDI r3, 84
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
