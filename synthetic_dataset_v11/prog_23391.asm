; DESCRIPTION: Draws a orange line from (2, 143) to (39, 158).
; PLAN: r0=2(x1), r1=143(y1), r2=39(x2), r3=158(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 143
LDI r2, 39
LDI r3, 158
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
