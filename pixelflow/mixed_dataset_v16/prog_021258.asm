; DESCRIPTION: Places a black line segment connecting (279, 187) to (147, 54).
; PLAN: r0=279(x1), r1=187(y1), r2=147(x2), r3=54(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 187
LDI r2, 147
LDI r3, 54
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
