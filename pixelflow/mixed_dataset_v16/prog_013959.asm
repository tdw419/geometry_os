; DESCRIPTION: Draws a orange line from (500, 221) to (134, 34).
; PLAN: r0=500(x1), r1=221(y1), r2=134(x2), r3=34(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 500
LDI r1, 221
LDI r2, 134
LDI r3, 34
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
