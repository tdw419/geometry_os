; DESCRIPTION: Draws a orange line from (332, 90) to (182, 79).
; PLAN: r0=332(x1), r1=90(y1), r2=182(x2), r3=79(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 90
LDI r2, 182
LDI r3, 79
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
