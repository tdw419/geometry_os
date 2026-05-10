; DESCRIPTION: Draws a green horizontal line across the screen at y=96.
; PLAN: r0x1), r1=1(y1), r2=9(x2), r3=9(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 1
LDI r2, 9
LDI r3, 9
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
