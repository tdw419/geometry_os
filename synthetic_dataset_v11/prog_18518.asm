; DESCRIPTION: Draws a orange line from (76, 167) to (26, 75).
; PLAN: r0=76(x1), r1=167(y1), r2=26(x2), r3=75(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 167
LDI r2, 26
LDI r3, 75
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
