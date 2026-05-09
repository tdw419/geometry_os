; DESCRIPTION: Draws a magenta line from (3, 62) to (302, 21).
; PLAN: r0=3(x1), r1=62(y1), r2=302(x2), r3=21(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 62
LDI r2, 302
LDI r3, 21
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
