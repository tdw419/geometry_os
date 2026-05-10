; DESCRIPTION: Draws a orange horizontal line across the screen at y=177.
; PLAN: r0=177(x1), r1=1(y1), r2=0(x2), r3=9(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 1
LDI r2, 0
LDI r3, 9
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
