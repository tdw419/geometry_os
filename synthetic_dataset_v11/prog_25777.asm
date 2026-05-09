; DESCRIPTION: Draws a orange line from (54, 62) to (207, 31).
; PLAN: r0=54(x1), r1=62(y1), r2=207(x2), r3=31(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 62
LDI r2, 207
LDI r3, 31
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
