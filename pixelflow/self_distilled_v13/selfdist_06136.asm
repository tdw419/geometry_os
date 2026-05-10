; DESCRIPTION: Draws a yellow horizontal line across the screen at y=53.
; PLAN: r0=53(x1), r1=53(y1), r2=5(x2), r3=1(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 53
LDI r2, 5
LDI r3, 1
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
