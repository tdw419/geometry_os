; DESCRIPTION: Draws a blue horizontal line across the screen at y=43.
; PLAN: r0x1), r1=1(y1), r2=0(x2), r3=1(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
