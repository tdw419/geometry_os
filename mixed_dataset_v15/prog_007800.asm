; DESCRIPTION: Draws a yellow rectangle at (389, 144) with width 84 and height 77.
; PLAN: r0=389(x), r1=144(y), r2=84(width), r3=77(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 389
LDI r1, 144
LDI r2, 84
LDI r3, 77
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
