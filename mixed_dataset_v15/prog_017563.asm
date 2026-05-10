; DESCRIPTION: Draws a orange line from (375, 229) to (127, 98).
; PLAN: r0=375(x1), r1=229(y1), r2=127(x2), r3=98(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 229
LDI r2, 127
LDI r3, 98
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
