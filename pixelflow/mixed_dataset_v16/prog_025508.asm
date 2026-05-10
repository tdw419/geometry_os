; DESCRIPTION: Draws a orange line from (212, 184) to (99, 65).
; PLAN: r0=212(x1), r1=184(y1), r2=99(x2), r3=65(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 184
LDI r2, 99
LDI r3, 65
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
