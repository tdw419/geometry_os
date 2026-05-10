; DESCRIPTION: Draws a blue vertical line down the screen at x=386.
; PLAN: r0x1), r1=10(y1), r2=0(x2), r3=1(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 386
LDI r1, 10
LDI r2, 0
LDI r3, 1
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
