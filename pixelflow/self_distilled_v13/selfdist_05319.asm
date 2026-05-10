; DESCRIPTION: Draws a orange line from (377, 61) to (106, 8).
; PLAN: r0=377(x1), r1=61(y1), r2=106(x2), r3=8(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 377
LDI r1, 61
LDI r2, 106
LDI r3, 8
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
