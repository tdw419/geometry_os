; DESCRIPTION: Draws a orange line from (20, 155) to (145, 230).
; PLAN: r0=20(x1), r1=155(y1), r2=145(x2), r3=230(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 155
LDI r2, 145
LDI r3, 230
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
