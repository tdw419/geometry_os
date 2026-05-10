; DESCRIPTION: Draws a orange line from (248, 160) to (306, 79).
; PLAN: r0=248(x1), r1=160(y1), r2=306(x2), r3=79(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 160
LDI r2, 306
LDI r3, 79
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
