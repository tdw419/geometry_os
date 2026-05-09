; DESCRIPTION: Draws a magenta line from (147, 222) to (223, 73).
; PLAN: r0=147(x1), r1=222(y1), r2=223(x2), r3=73(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 222
LDI r2, 223
LDI r3, 73
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
