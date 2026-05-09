; DESCRIPTION: Draws a orange line from (395, 75) to (494, 169).
; PLAN: r0=395(x1), r1=75(y1), r2=494(x2), r3=169(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 395
LDI r1, 75
LDI r2, 494
LDI r3, 169
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
