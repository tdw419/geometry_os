; DESCRIPTION: Draws a blue rectangle at (12, 151) with width 69 and height 62.
; PLAN: r0=12(x), r1=151(y), r2=69(width), r3=62(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 151
LDI r2, 69
LDI r3, 62
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
