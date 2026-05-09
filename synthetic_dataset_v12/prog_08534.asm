; DESCRIPTION: Draws a black rectangle at (54, 64) with width 67 and height 26.
; PLAN: r0=54(x), r1=64(y), r2=67(width), r3=26(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 64
LDI r2, 67
LDI r3, 26
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
