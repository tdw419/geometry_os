; DESCRIPTION: Draws a orange line from (191, 143) to (238, 34).
; PLAN: r0=191(x1), r1=143(y1), r2=238(x2), r3=34(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 143
LDI r2, 238
LDI r3, 34
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
