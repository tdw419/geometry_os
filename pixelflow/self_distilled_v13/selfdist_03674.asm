; DESCRIPTION: Draws a orange horizontal line across the screen at y=185.
; PLAN: r0=185(x1), r1=10(y1), r2=4(x2), r3=0(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 10
LDI r2, 4
LDI r3, 0
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
