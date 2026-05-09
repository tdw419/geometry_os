; DESCRIPTION: Draws a orange line from (38, 2) to (291, 176).
; PLAN: r0=38(x1), r1=2(y1), r2=291(x2), r3=176(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 2
LDI r2, 291
LDI r3, 176
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
