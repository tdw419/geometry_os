; DESCRIPTION: Draws a yellow line from (364, 89) to (15, 123).
; PLAN: r0=364(x1), r1=89(y1), r2=15(x2), r3=123(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 364
LDI r1, 89
LDI r2, 15
LDI r3, 123
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
