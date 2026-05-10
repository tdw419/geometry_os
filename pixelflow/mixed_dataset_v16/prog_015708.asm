; DESCRIPTION: Draws a orange line from (266, 205) to (222, 116).
; PLAN: r0=266(x1), r1=205(y1), r2=222(x2), r3=116(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 205
LDI r2, 222
LDI r3, 116
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
