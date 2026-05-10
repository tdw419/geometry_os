; DESCRIPTION: Draws a yellow horizontal line across the screen at y=116.
; PLAN: r0=0(x1), r1=1(y1), r2=1(x2), r3=9(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 1
LDI r2, 1
LDI r3, 9
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
