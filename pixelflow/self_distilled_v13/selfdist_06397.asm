; DESCRIPTION: Draws a orange vertical line down the screen at x=153.
; PLAN: r0=153(x1), r1=15(y1), r2=0(x2), r3=2(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 15
LDI r2, 0
LDI r3, 2
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
