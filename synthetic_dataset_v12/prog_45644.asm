; DESCRIPTION: Draws a orange line from (17, 15) to (426, 99).
; PLAN: r0=17(x1), r1=15(y1), r2=426(x2), r3=99(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 15
LDI r2, 426
LDI r3, 99
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
