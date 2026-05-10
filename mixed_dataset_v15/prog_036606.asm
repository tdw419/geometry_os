; DESCRIPTION: Draws a yellow vertical line down the screen at x=356.
; PLAN: r0=356(x1), r1=10(y1), r2=35(x2), r3=1(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 10
LDI r2, 35
LDI r3, 1
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
