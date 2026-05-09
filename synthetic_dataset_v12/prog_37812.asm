; DESCRIPTION: Draws a orange line from (110, 2) to (190, 249).
; PLAN: r0=110(x1), r1=2(y1), r2=190(x2), r3=249(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 2
LDI r2, 190
LDI r3, 249
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
