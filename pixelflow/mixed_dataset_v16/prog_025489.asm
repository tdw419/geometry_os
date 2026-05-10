; DESCRIPTION: Draws a orange line from (13, 13) to (91, 70).
; PLAN: r0=13(x1), r1=13(y1), r2=91(x2), r3=70(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 13
LDI r2, 91
LDI r3, 70
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
