; DESCRIPTION: Draws a orange line from (231, 82) to (54, 78).
; PLAN: r0=231(x1), r1=82(y1), r2=54(x2), r3=78(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 82
LDI r2, 54
LDI r3, 78
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
