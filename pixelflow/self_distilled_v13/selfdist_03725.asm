; DESCRIPTION: Draws a orange line from (376, 180) to (334, 92).
; PLAN: r0=376(x1), r1=180(y1), r2=334(x2), r3=92(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 180
LDI r2, 334
LDI r3, 92
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
