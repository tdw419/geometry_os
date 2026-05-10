; DESCRIPTION: Draws a blue rectangle at (284, 123) with width 62 and height 49.
; PLAN: r0=284(x), r1=123(y), r2=62(width), r3=49(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 123
LDI r2, 62
LDI r3, 49
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
