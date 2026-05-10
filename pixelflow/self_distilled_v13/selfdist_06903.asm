; DESCRIPTION: Draws a yellow vertical line down the screen at x=321.
; PLAN: r0=321(x1), r1=10(y1), r2=3(x2), r3=1(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 10
LDI r2, 3
LDI r3, 1
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
