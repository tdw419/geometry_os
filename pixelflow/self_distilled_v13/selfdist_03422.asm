; DESCRIPTION: Draws a orange horizontal line across the screen at y=112.
; PLAN: r0=112(x1), r1=1(y1), r2=1(x2), r3=9(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 1
LDI r2, 1
LDI r3, 9
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
