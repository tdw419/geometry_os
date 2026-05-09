; DESCRIPTION: Draws a orange line from (155, 20) to (200, 193).
; PLAN: r0=155(x1), r1=20(y1), r2=200(x2), r3=193(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 20
LDI r2, 200
LDI r3, 193
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
