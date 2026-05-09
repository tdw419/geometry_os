; DESCRIPTION: Draws a orange line from (117, 99) to (162, 251).
; PLAN: r0=117(x1), r1=99(y1), r2=162(x2), r3=251(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 99
LDI r2, 162
LDI r3, 251
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
