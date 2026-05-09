; DESCRIPTION: Draws a orange line from (125, 9) to (166, 110).
; PLAN: r0=125(x1), r1=9(y1), r2=166(x2), r3=110(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 9
LDI r2, 166
LDI r3, 110
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
