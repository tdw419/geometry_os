; DESCRIPTION: Draws a yellow line from (1, 25) to (65, 147).
; PLAN: r0=1(x1), r1=25(y1), r2=65(x2), r3=147(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 25
LDI r2, 65
LDI r3, 147
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
