; DESCRIPTION: Draws a orange line from (497, 14) to (111, 6).
; PLAN: r0=497(x1), r1=14(y1), r2=111(x2), r3=6(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 497
LDI r1, 14
LDI r2, 111
LDI r3, 6
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
