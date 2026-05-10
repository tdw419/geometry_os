; DESCRIPTION: Draws a orange line from (372, 198) to (94, 110).
; PLAN: r0=372(x1), r1=198(y1), r2=94(x2), r3=110(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 198
LDI r2, 94
LDI r3, 110
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
