; DESCRIPTION: Draws a blue rectangle at (67, 28) with width 32 and height 38.
; PLAN: r0=67(x), r1=28(y), r2=32(width), r3=38(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 28
LDI r2, 32
LDI r3, 38
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
