; DESCRIPTION: Draws a orange line from (248, 66) to (76, 76).
; PLAN: r0=248(x1), r1=66(y1), r2=76(x2), r3=76(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 66
LDI r2, 76
LDI r3, 76
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
