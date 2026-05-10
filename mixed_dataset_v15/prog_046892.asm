; DESCRIPTION: Draws a orange line from (437, 172) to (381, 98).
; PLAN: r0=437(x1), r1=172(y1), r2=381(x2), r3=98(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 437
LDI r1, 172
LDI r2, 381
LDI r3, 98
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
