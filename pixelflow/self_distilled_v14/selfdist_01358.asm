; DESCRIPTION: Draws a red horizontal line across the screen at y=198.
; PLAN: r0=198(x1), r1=1(y1), r2=19(x2), r3=9(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 1
LDI r2, 19
LDI r3, 9
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
