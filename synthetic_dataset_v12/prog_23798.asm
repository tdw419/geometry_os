; DESCRIPTION: Draws a orange line from (414, 9) to (292, 98).
; PLAN: r0=414(x1), r1=9(y1), r2=292(x2), r3=98(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 9
LDI r2, 292
LDI r3, 98
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
