; DESCRIPTION: Draws a orange line from (250, 2) to (483, 105).
; PLAN: r0=250(x1), r1=2(y1), r2=483(x2), r3=105(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 2
LDI r2, 483
LDI r3, 105
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
