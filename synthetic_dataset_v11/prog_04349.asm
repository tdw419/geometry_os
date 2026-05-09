; DESCRIPTION: Draws a orange line from (157, 91) to (9, 86).
; PLAN: r0=157(x1), r1=91(y1), r2=9(x2), r3=86(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 91
LDI r2, 9
LDI r3, 86
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
