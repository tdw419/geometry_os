; DESCRIPTION: Draws a orange line from (15, 112) to (170, 99).
; PLAN: r0=15(x1), r1=112(y1), r2=170(x2), r3=99(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 112
LDI r2, 170
LDI r3, 99
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
