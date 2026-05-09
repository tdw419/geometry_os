; DESCRIPTION: Draws a magenta line from (395, 147) to (448, 223).
; PLAN: r0=395(x1), r1=147(y1), r2=448(x2), r3=223(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 395
LDI r1, 147
LDI r2, 448
LDI r3, 223
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
