; DESCRIPTION: Draws a orange line from (17, 4) to (135, 100).
; PLAN: r0=17(x1), r1=4(y1), r2=135(x2), r3=100(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 4
LDI r2, 135
LDI r3, 100
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
