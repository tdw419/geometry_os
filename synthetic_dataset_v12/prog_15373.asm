; DESCRIPTION: Draws a orange line from (157, 158) to (365, 247).
; PLAN: r0=157(x1), r1=158(y1), r2=365(x2), r3=247(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 158
LDI r2, 365
LDI r3, 247
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
