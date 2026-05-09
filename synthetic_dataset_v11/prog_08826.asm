; DESCRIPTION: Draws a orange line from (34, 34) to (16, 1).
; PLAN: r0=34(x1), r1=34(y1), r2=16(x2), r3=1(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 34
LDI r2, 16
LDI r3, 1
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
