; DESCRIPTION: Draws a orange line from (50, 99) to (140, 133).
; PLAN: r0=50(x1), r1=99(y1), r2=140(x2), r3=133(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 99
LDI r2, 140
LDI r3, 133
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
