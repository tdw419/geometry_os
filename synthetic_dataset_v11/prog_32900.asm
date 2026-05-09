; DESCRIPTION: Draws a orange line from (212, 166) to (36, 70).
; PLAN: r0=212(x1), r1=166(y1), r2=36(x2), r3=70(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 166
LDI r2, 36
LDI r3, 70
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
