; DESCRIPTION: Draws a orange line from (217, 245) to (60, 106).
; PLAN: r0=217(x1), r1=245(y1), r2=60(x2), r3=106(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 245
LDI r2, 60
LDI r3, 106
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
