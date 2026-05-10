; DESCRIPTION: Draws a orange horizontal line across the screen at y=146.
; PLAN: r0=146(x1), r1=1(y1), r2=1(x2), r3=7(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 1
LDI r2, 1
LDI r3, 7
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
