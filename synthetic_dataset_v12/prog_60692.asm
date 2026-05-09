; DESCRIPTION: Draws a orange line from (134, 38) to (64, 245).
; PLAN: r0=134(x1), r1=38(y1), r2=64(x2), r3=245(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 38
LDI r2, 64
LDI r3, 245
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
