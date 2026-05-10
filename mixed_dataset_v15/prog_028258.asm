; DESCRIPTION: Draws a orange line from (497, 175) to (310, 25).
; PLAN: r0=497(x1), r1=175(y1), r2=310(x2), r3=25(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 497
LDI r1, 175
LDI r2, 310
LDI r3, 25
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
