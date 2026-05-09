; DESCRIPTION: Draws a orange line from (127, 13) to (3, 130).
; PLAN: r0=127(x1), r1=13(y1), r2=3(x2), r3=130(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 13
LDI r2, 3
LDI r3, 130
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
