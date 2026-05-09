; DESCRIPTION: Draws a orange line from (87, 1) to (1, 119).
; PLAN: r0=87(x1), r1=1(y1), r2=1(x2), r3=119(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 1
LDI r2, 1
LDI r3, 119
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
