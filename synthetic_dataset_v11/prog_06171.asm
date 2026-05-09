; DESCRIPTION: Draws a magenta line from (147, 208) to (223, 48).
; PLAN: r0=147(x1), r1=208(y1), r2=223(x2), r3=48(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 208
LDI r2, 223
LDI r3, 48
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
