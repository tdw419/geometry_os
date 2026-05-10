; DESCRIPTION: Draws a orange horizontal line across the screen at y=97.
; PLAN: r0=97(x1), r1=72(y1), r2=2(x2), r3=9(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 72
LDI r2, 2
LDI r3, 9
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
