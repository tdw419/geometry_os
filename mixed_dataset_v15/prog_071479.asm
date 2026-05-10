; DESCRIPTION: Draws a orange line from (483, 12) to (352, 130).
; PLAN: r0=483(x1), r1=12(y1), r2=352(x2), r3=130(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 483
LDI r1, 12
LDI r2, 352
LDI r3, 130
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
