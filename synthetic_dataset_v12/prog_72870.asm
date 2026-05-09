; DESCRIPTION: Draws a orange line from (441, 178) to (145, 34).
; PLAN: r0=441(x1), r1=178(y1), r2=145(x2), r3=34(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 441
LDI r1, 178
LDI r2, 145
LDI r3, 34
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
