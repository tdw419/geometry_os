; DESCRIPTION: Draws a orange line from (22, 13) to (188, 120).
; PLAN: r0=22(x1), r1=13(y1), r2=188(x2), r3=120(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 13
LDI r2, 188
LDI r3, 120
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
