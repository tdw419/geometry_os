; DESCRIPTION: Draws a orange line from (334, 86) to (157, 4).
; PLAN: r0=334(x1), r1=86(y1), r2=157(x2), r3=4(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 86
LDI r2, 157
LDI r3, 4
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
