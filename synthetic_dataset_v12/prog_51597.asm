; DESCRIPTION: Draws a orange line from (10, 39) to (371, 201).
; PLAN: r0=10(x1), r1=39(y1), r2=371(x2), r3=201(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 39
LDI r2, 371
LDI r3, 201
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
