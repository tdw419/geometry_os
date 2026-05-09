; DESCRIPTION: Draws a orange line from (47, 6) to (299, 6).
; PLAN: r0=47(x1), r1=6(y1), r2=299(x2), r3=6(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 6
LDI r2, 299
LDI r3, 6
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
