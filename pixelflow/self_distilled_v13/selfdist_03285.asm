; DESCRIPTION: Draws a orange vertical line down the screen at x=353.
; PLAN: r0=353(x1), r1=10(y1), r2=35(x2), r3=9(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 10
LDI r2, 35
LDI r3, 9
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
