; DESCRIPTION: Draws a orange line from (113, 70) to (89, 130).
; PLAN: r0=113(x1), r1=70(y1), r2=89(x2), r3=130(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 70
LDI r2, 89
LDI r3, 130
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
