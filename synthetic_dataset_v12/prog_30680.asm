; DESCRIPTION: Draws a yellow line from (302, 146) to (381, 155).
; PLAN: r0=302(x1), r1=146(y1), r2=381(x2), r3=155(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 146
LDI r2, 381
LDI r3, 155
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
