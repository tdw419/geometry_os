; DESCRIPTION: Draws a blue vertical line down the screen at x=49.
; PLAN: r0=49(x1), r1=1(y1), r2=9(x2), r3=1(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 1
LDI r2, 9
LDI r3, 1
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
