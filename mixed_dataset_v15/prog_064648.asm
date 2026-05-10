; DESCRIPTION: Draws a yellow line from (273, 102) to (491, 137).
; PLAN: r0=273(x1), r1=102(y1), r2=491(x2), r3=137(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 102
LDI r2, 491
LDI r3, 137
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
