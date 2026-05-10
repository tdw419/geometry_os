; DESCRIPTION: Draws a orange line from (229, 157) to (201, 11).
; PLAN: r0=229(x1), r1=157(y1), r2=201(x2), r3=11(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 157
LDI r2, 201
LDI r3, 11
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
