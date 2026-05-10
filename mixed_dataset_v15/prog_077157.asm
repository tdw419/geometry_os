; DESCRIPTION: Draws a orange vertical line down the screen at x=12.
; PLAN: r0=12(x1), r1=1(y1), r2=0(x2), r3=9(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 1
LDI r2, 0
LDI r3, 9
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
