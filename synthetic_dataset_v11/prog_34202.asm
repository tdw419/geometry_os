; DESCRIPTION: Draws a orange line from (47, 176) to (31, 200).
; PLAN: r0=47(x1), r1=176(y1), r2=31(x2), r3=200(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 176
LDI r2, 31
LDI r3, 200
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
