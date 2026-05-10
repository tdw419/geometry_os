; DESCRIPTION: Draws a blue horizontal line across the screen at y=125.
; PLAN: r0=125(x1), r1=1(y1), r2=2(x2), r3=9(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 1
LDI r2, 2
LDI r3, 9
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
