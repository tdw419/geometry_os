; DESCRIPTION: Draws a orange line from (52, 187) to (336, 56).
; PLAN: r0=52(x1), r1=187(y1), r2=336(x2), r3=56(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 187
LDI r2, 336
LDI r3, 56
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
