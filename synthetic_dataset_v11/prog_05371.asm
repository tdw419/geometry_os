; DESCRIPTION: Draws a orange line from (227, 38) to (231, 59).
; PLAN: r0=227(x1), r1=38(y1), r2=231(x2), r3=59(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 38
LDI r2, 231
LDI r3, 59
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
