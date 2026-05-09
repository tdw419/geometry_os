; DESCRIPTION: Draws a orange line from (328, 39) to (159, 161).
; PLAN: r0=328(x1), r1=39(y1), r2=159(x2), r3=161(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 39
LDI r2, 159
LDI r3, 161
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
