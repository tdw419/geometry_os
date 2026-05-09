; DESCRIPTION: Draws a orange line from (151, 117) to (75, 2).
; PLAN: r0=151(x1), r1=117(y1), r2=75(x2), r3=2(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 117
LDI r2, 75
LDI r3, 2
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
