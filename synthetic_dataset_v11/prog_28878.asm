; DESCRIPTION: Draws a magenta line from (147, 43) to (9, 183).
; PLAN: r0=147(x1), r1=43(y1), r2=9(x2), r3=183(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 43
LDI r2, 9
LDI r3, 183
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
