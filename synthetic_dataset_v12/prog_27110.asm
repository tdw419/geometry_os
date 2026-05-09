; DESCRIPTION: Draws a orange line from (85, 146) to (377, 69).
; PLAN: r0=85(x1), r1=146(y1), r2=377(x2), r3=69(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 146
LDI r2, 377
LDI r3, 69
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
