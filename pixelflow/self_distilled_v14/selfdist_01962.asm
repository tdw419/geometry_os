; DESCRIPTION: Draws a green line from (52, 89) to (22, 147).
; PLAN: r0=52(x1), r1=89(y1), r2=22(x2), r3=147(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 89
LDI r2, 22
LDI r3, 147
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
