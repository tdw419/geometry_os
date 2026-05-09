; DESCRIPTION: Draws a purple rectangle at (327, 88) with width 20 and height 113.
; PLAN: r0=327(x), r1=88(y), r2=20(width), r3=113(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 327
LDI r1, 88
LDI r2, 20
LDI r3, 113
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
