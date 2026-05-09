; DESCRIPTION: Draws a orange line from (90, 71) to (251, 34).
; PLAN: r0=90(x1), r1=71(y1), r2=251(x2), r3=34(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 71
LDI r2, 251
LDI r3, 34
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
