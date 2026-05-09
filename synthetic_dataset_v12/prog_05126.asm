; DESCRIPTION: Draws a blue rectangle at (38, 90) with width 96 and height 49.
; PLAN: r0=38(x), r1=90(y), r2=96(width), r3=49(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 90
LDI r2, 96
LDI r3, 49
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
