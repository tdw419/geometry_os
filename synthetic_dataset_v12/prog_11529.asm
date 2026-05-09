; DESCRIPTION: Draws a orange line from (231, 114) to (292, 49).
; PLAN: r0=231(x1), r1=114(y1), r2=292(x2), r3=49(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 114
LDI r2, 292
LDI r3, 49
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
