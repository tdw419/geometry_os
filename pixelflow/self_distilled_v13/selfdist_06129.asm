; DESCRIPTION: Draws a orange vertical line down the screen at x=350.
; PLAN: r0=350(x1), r1=10(y1), r2=3(x2), r3=1(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 10
LDI r2, 3
LDI r3, 1
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
