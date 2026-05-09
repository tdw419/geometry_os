; DESCRIPTION: Draws a blue rectangle at (397, 30) with width 49 and height 62.
; PLAN: r0=397(x), r1=30(y), r2=49(width), r3=62(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 397
LDI r1, 30
LDI r2, 49
LDI r3, 62
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
