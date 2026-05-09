; DESCRIPTION: Draws a orange line from (139, 154) to (80, 78).
; PLAN: r0=139(x1), r1=154(y1), r2=80(x2), r3=78(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 154
LDI r2, 80
LDI r3, 78
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
