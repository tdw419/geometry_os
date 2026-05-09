; DESCRIPTION: Draws a orange line from (293, 145) to (136, 94).
; PLAN: r0=293(x1), r1=145(y1), r2=136(x2), r3=94(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 293
LDI r1, 145
LDI r2, 136
LDI r3, 94
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
