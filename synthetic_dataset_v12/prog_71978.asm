; DESCRIPTION: Draws a orange line from (377, 155) to (336, 180).
; PLAN: r0=377(x1), r1=155(y1), r2=336(x2), r3=180(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 377
LDI r1, 155
LDI r2, 336
LDI r3, 180
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
