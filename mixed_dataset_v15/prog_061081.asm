; DESCRIPTION: Draws a blue horizontal line across the screen at y=190.
; PLAN: r0x1), r1=1(y1), r2=19(x2), r3=1(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 1
LDI r2, 19
LDI r3, 1
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
