; DESCRIPTION: Draws a blue rectangle at (370, 157) with width 43 and height 19.
; PLAN: r0=370(x), r1=157(y), r2=43(width), r3=19(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 157
LDI r2, 43
LDI r3, 19
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
