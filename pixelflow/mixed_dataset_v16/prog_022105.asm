; DESCRIPTION: Draws a orange line from (428, 61) to (118, 39).
; PLAN: r0=428(x1), r1=61(y1), r2=118(x2), r3=39(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 428
LDI r1, 61
LDI r2, 118
LDI r3, 39
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
