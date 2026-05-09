; DESCRIPTION: Draws a blue rectangle at (96, 64) with width 69 and height 113.
; PLAN: r0=96(x), r1=64(y), r2=69(width), r3=113(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 64
LDI r2, 69
LDI r3, 113
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
