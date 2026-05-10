; DESCRIPTION: Draws a yellow line from (265, 89) to (147, 40).
; PLAN: r0=265(x1), r1=89(y1), r2=147(x2), r3=40(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 89
LDI r2, 147
LDI r3, 40
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
