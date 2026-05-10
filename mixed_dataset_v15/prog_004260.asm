; DESCRIPTION: Draws a orange line from (501, 37) to (141, 188).
; PLAN: r0=501(x1), r1=37(y1), r2=141(x2), r3=188(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 501
LDI r1, 37
LDI r2, 141
LDI r3, 188
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
