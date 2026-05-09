; DESCRIPTION: Draws a green line from (6, 110) to (147, 132).
; PLAN: r0=6(x1), r1=110(y1), r2=147(x2), r3=132(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 110
LDI r2, 147
LDI r3, 132
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
