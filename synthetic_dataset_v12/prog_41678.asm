; DESCRIPTION: Draws a orange line from (215, 94) to (200, 201).
; PLAN: r0=215(x1), r1=94(y1), r2=200(x2), r3=201(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 94
LDI r2, 200
LDI r3, 201
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
