; DESCRIPTION: Draws a magenta line from (378, 106) to (84, 54).
; PLAN: r0=378(x1), r1=106(y1), r2=84(x2), r3=54(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 106
LDI r2, 84
LDI r3, 54
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
