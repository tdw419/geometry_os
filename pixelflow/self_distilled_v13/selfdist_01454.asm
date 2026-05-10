; DESCRIPTION: Draws a orange line from (380, 7) to (159, 60).
; PLAN: r0=380(x1), r1=7(y1), r2=159(x2), r3=60(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 7
LDI r2, 159
LDI r3, 60
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
