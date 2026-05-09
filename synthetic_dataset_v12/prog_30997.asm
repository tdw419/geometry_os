; DESCRIPTION: Draws a blue rectangle at (384, 209) with width 69 and height 28.
; PLAN: r0=384(x), r1=209(y), r2=69(width), r3=28(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 384
LDI r1, 209
LDI r2, 69
LDI r3, 28
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
