; DESCRIPTION: Draws a orange line from (299, 174) to (428, 15).
; PLAN: r0=299(x1), r1=174(y1), r2=428(x2), r3=15(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 174
LDI r2, 428
LDI r3, 15
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
