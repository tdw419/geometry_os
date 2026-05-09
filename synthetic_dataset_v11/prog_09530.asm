; DESCRIPTION: Draws a blue rectangle at (35, 171) with width 96 and height 62.
; PLAN: r0=35(x), r1=171(y), r2=96(width), r3=62(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 171
LDI r2, 96
LDI r3, 62
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
