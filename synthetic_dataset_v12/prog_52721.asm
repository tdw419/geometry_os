; DESCRIPTION: Draws a orange line from (65, 111) to (37, 145).
; PLAN: r0=65(x1), r1=111(y1), r2=37(x2), r3=145(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 111
LDI r2, 37
LDI r3, 145
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
