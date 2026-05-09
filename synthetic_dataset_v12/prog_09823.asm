; DESCRIPTION: Draws a orange line from (137, 28) to (277, 63).
; PLAN: r0=137(x1), r1=28(y1), r2=277(x2), r3=63(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 28
LDI r2, 277
LDI r3, 63
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
