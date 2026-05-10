; DESCRIPTION: Draws a magenta line from (393, 108) to (296, 22).
; PLAN: r0=393(x1), r1=108(y1), r2=296(x2), r3=22(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 108
LDI r2, 296
LDI r3, 22
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
