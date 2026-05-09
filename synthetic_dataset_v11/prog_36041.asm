; DESCRIPTION: Draws a orange line from (218, 201) to (145, 145).
; PLAN: r0=218(x1), r1=201(y1), r2=145(x2), r3=145(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 201
LDI r2, 145
LDI r3, 145
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
