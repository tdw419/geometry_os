; DESCRIPTION: Draws a orange line from (430, 15) to (51, 56).
; PLAN: r0=430(x1), r1=15(y1), r2=51(x2), r3=56(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 430
LDI r1, 15
LDI r2, 51
LDI r3, 56
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
