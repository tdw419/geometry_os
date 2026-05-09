; DESCRIPTION: Draws a orange line from (430, 245) to (324, 71).
; PLAN: r0=430(x1), r1=245(y1), r2=324(x2), r3=71(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 430
LDI r1, 245
LDI r2, 324
LDI r3, 71
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
