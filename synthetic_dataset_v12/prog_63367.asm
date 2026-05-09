; DESCRIPTION: Draws a yellow line from (448, 110) to (158, 99).
; PLAN: r0=448(x1), r1=110(y1), r2=158(x2), r3=99(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 448
LDI r1, 110
LDI r2, 158
LDI r3, 99
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
