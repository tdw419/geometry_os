; DESCRIPTION: Draws a yellow vertical line down the screen at x=395.
; PLAN: r0=395(x1), r1=10(y1), r2=9(x2), r3=9(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 395
LDI r1, 10
LDI r2, 9
LDI r3, 9
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
