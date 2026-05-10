; DESCRIPTION: Draws a white vertical line down the screen at x=240.
; PLAN: r0=240(x1), r1=1(y1), r2=2(x2), r3=9(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 1
LDI r2, 2
LDI r3, 9
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
