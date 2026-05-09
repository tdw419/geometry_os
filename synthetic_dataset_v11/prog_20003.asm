; DESCRIPTION: Draws a orange line from (19, 50) to (157, 31).
; PLAN: r0=19(x1), r1=50(y1), r2=157(x2), r3=31(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 50
LDI r2, 157
LDI r3, 31
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
