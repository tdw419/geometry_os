; DESCRIPTION: Draws a blue rectangle at (395, 35) with width 56 and height 14.
; PLAN: r0=395(x), r1=35(y), r2=56(width), r3=14(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 395
LDI r1, 35
LDI r2, 56
LDI r3, 14
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
