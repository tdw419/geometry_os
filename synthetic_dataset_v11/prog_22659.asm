; DESCRIPTION: Draws a blue rectangle at (43, 122) with width 90 and height 60.
; PLAN: r0=43(x), r1=122(y), r2=90(width), r3=60(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 122
LDI r2, 90
LDI r3, 60
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
