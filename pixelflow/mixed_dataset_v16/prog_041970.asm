; DESCRIPTION: Draws a red line from (137, 186) to (491, 110).
; PLAN: r0=137(x1), r1=186(y1), r2=491(x2), r3=110(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 186
LDI r2, 491
LDI r3, 110
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
