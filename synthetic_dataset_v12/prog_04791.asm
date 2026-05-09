; DESCRIPTION: Draws a magenta line from (302, 156) to (202, 3).
; PLAN: r0=302(x1), r1=156(y1), r2=202(x2), r3=3(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 156
LDI r2, 202
LDI r3, 3
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
