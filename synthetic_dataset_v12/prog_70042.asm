; DESCRIPTION: Draws a magenta line from (256, 198) to (302, 118).
; PLAN: r0=256(x1), r1=198(y1), r2=302(x2), r3=118(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 198
LDI r2, 302
LDI r3, 118
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
