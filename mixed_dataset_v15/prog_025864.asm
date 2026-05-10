; DESCRIPTION: Draws a yellow vertical line down the screen at x=202.
; PLAN: r0=202(x1), r1=10(y1), r2=0(x2), r3=4(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 10
LDI r2, 0
LDI r3, 4
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
