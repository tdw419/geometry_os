; DESCRIPTION: Draws a yellow line from (1, 144) to (137, 20).
; PLAN: r0=1(x1), r1=144(y1), r2=137(x2), r3=20(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 144
LDI r2, 137
LDI r3, 20
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
