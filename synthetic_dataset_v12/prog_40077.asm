; DESCRIPTION: Draws a blue rectangle at (313, 26) with width 110 and height 38.
; PLAN: r0=313(x), r1=26(y), r2=110(width), r3=38(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 26
LDI r2, 110
LDI r3, 38
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
