; DESCRIPTION: Draws a orange line from (134, 21) to (421, 39).
; PLAN: r0=134(x1), r1=21(y1), r2=421(x2), r3=39(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 21
LDI r2, 421
LDI r3, 39
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
