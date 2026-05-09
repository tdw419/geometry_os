; DESCRIPTION: Draws a orange line from (360, 101) to (463, 84).
; PLAN: r0=360(x1), r1=101(y1), r2=463(x2), r3=84(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 360
LDI r1, 101
LDI r2, 463
LDI r3, 84
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
