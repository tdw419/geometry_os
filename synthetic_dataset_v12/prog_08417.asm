; DESCRIPTION: Draws a orange line from (313, 116) to (22, 116).
; PLAN: r0=313(x1), r1=116(y1), r2=22(x2), r3=116(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 116
LDI r2, 22
LDI r3, 116
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
