; DESCRIPTION: Draws a orange line from (130, 140) to (462, 26).
; PLAN: r0=130(x1), r1=140(y1), r2=462(x2), r3=26(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 140
LDI r2, 462
LDI r3, 26
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
