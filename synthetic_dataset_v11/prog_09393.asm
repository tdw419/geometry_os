; DESCRIPTION: Draws a orange line from (226, 6) to (248, 13).
; PLAN: r0=226(x1), r1=6(y1), r2=248(x2), r3=13(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 6
LDI r2, 248
LDI r3, 13
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
