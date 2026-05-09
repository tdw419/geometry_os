; DESCRIPTION: Draws a orange line from (14, 100) to (99, 255).
; PLAN: r0=14(x1), r1=100(y1), r2=99(x2), r3=255(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 100
LDI r2, 99
LDI r3, 255
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
