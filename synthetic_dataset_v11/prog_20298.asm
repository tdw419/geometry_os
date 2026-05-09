; DESCRIPTION: Draws a orange line from (172, 118) to (18, 62).
; PLAN: r0=172(x1), r1=118(y1), r2=18(x2), r3=62(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 118
LDI r2, 18
LDI r3, 62
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
