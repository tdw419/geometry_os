; DESCRIPTION: Draws a blue rectangle at (287, 96) with width 40 and height 100.
; PLAN: r0=287(x), r1=96(y), r2=40(width), r3=100(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 96
LDI r2, 40
LDI r3, 100
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
