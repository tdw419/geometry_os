; DESCRIPTION: Draws a yellow horizontal line across the screen at y=65.
; PLAN: r0=75(x1), r1=1(y1), r2=0(x2), r3=2(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 1
LDI r2, 0
LDI r3, 2
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
