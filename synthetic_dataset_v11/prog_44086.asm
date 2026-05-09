; DESCRIPTION: Draws a orange line from (11, 132) to (78, 56).
; PLAN: r0=11(x1), r1=132(y1), r2=78(x2), r3=56(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 132
LDI r2, 78
LDI r3, 56
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
