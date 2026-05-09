; DESCRIPTION: Draws a white rectangle at (412, 49) with width 14 and height 67.
; PLAN: r0=412(x), r1=49(y), r2=14(width), r3=67(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 412
LDI r1, 49
LDI r2, 14
LDI r3, 67
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
