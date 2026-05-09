; DESCRIPTION: Draws a blue rectangle at (327, 140) with width 88 and height 69.
; PLAN: r0=327(x), r1=140(y), r2=88(width), r3=69(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 327
LDI r1, 140
LDI r2, 88
LDI r3, 69
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
