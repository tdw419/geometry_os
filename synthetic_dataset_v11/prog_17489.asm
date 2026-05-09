; DESCRIPTION: Draws a orange line from (59, 43) to (158, 33).
; PLAN: r0=59(x1), r1=43(y1), r2=158(x2), r3=33(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 43
LDI r2, 158
LDI r3, 33
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
