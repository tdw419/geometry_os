; DESCRIPTION: Draws a blue rectangle at (287, 25) with width 73 and height 108.
; PLAN: r0=287(x), r1=25(y), r2=73(width), r3=108(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 25
LDI r2, 73
LDI r3, 108
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
