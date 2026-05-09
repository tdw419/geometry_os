; DESCRIPTION: Draws a orange line from (137, 161) to (379, 70).
; PLAN: r0=137(x1), r1=161(y1), r2=379(x2), r3=70(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 161
LDI r2, 379
LDI r3, 70
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
