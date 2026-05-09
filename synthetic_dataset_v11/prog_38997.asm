; DESCRIPTION: Draws a orange line from (54, 98) to (201, 2).
; PLAN: r0=54(x1), r1=98(y1), r2=201(x2), r3=2(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 98
LDI r2, 201
LDI r3, 2
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
