; DESCRIPTION: Draws a orange line from (15, 91) to (251, 23).
; PLAN: r0=15(x1), r1=91(y1), r2=251(x2), r3=23(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 91
LDI r2, 251
LDI r3, 23
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
