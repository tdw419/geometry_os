; DESCRIPTION: Draws a orange line from (85, 8) to (8, 234).
; PLAN: r0=85(x1), r1=8(y1), r2=8(x2), r3=234(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 8
LDI r2, 8
LDI r3, 234
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
