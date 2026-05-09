; DESCRIPTION: Draws a orange line from (187, 137) to (40, 62).
; PLAN: r0=187(x1), r1=137(y1), r2=40(x2), r3=62(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 137
LDI r2, 40
LDI r3, 62
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
