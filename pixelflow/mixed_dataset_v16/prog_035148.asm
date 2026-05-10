; DESCRIPTION: Draws a orange line from (37, 71) to (486, 44).
; PLAN: r0=37(x1), r1=71(y1), r2=486(x2), r3=44(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 71
LDI r2, 486
LDI r3, 44
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
