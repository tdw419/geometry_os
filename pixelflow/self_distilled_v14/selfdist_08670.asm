; DESCRIPTION: Draws a orange vertical line down the screen at x=174.
; PLAN: r0=174(x1), r1=1(y1), r2=3(x2), r3=9(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 1
LDI r2, 3
LDI r3, 9
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
