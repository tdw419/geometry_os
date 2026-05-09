; DESCRIPTION: Draws a orange line from (184, 178) to (99, 70).
; PLAN: r0=184(x1), r1=178(y1), r2=99(x2), r3=70(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 178
LDI r2, 99
LDI r3, 70
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
