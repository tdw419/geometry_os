; DESCRIPTION: Draws a orange horizontal line across the screen at y=48.
; PLAN: r0=48(x1), r1=0(y1), r2=0(x2), r3=9(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 0
LDI r2, 0
LDI r3, 9
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
