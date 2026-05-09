; DESCRIPTION: Draws a orange line from (24, 26) to (49, 182).
; PLAN: r0=24(x1), r1=26(y1), r2=49(x2), r3=182(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 26
LDI r2, 49
LDI r3, 182
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
