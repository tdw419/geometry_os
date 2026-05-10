; DESCRIPTION: Draws a green vertical line down the screen at x=241.
; PLAN: r0x1), r1=1(y1), r2=0(x2), r3=5(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 1
LDI r2, 0
LDI r3, 5
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
