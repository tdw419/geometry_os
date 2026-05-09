; DESCRIPTION: Draws a orange line from (286, 106) to (324, 54).
; PLAN: r0=286(x1), r1=106(y1), r2=324(x2), r3=54(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 286
LDI r1, 106
LDI r2, 324
LDI r3, 54
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
