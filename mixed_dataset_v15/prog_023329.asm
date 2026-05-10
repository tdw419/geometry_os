; DESCRIPTION: Draws a orange line from (455, 58) to (273, 62).
; PLAN: r0=455(x1), r1=58(y1), r2=273(x2), r3=62(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 455
LDI r1, 58
LDI r2, 273
LDI r3, 62
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
