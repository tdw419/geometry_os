; DESCRIPTION: Draws a orange line from (416, 185) to (221, 137).
; PLAN: r0=416(x1), r1=185(y1), r2=221(x2), r3=137(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 416
LDI r1, 185
LDI r2, 221
LDI r3, 137
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
