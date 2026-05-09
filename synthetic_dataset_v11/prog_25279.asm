; DESCRIPTION: Draws a orange line from (222, 113) to (84, 36).
; PLAN: r0=222(x1), r1=113(y1), r2=84(x2), r3=36(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 113
LDI r2, 84
LDI r3, 36
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
