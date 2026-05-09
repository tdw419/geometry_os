; DESCRIPTION: Draws a magenta line from (431, 188) to (370, 3).
; PLAN: r0=431(x1), r1=188(y1), r2=370(x2), r3=3(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 431
LDI r1, 188
LDI r2, 370
LDI r3, 3
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
